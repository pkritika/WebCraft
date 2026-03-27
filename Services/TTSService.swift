import AVFoundation
import SwiftUI

/// Simple Text-To-Speech service for reading lesson content aloud.
@MainActor
class TTSService: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    static let shared = TTSService()
    
    private let synthesizer = AVSpeechSynthesizer()
    @Published var isSpeaking = false
    
    private override init() {
        super.init()
        synthesizer.delegate = self
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio, options: .duckOthers)
        try? AVAudioSession.sharedInstance().setActive(true)
    }
    
    func speak(_ text: String) {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        
        // Clean markdown artifacts
        var cleanedText = text.replacingOccurrences(of: "**", with: "")
                              .replacingOccurrences(of: "`", with: "")
        
        // Convert emoji structural elements to text
        cleanedText = cleanedText.replacingOccurrences(of: "💡", with: "Tip: ")
                                 .replacingOccurrences(of: "📝", with: "Note: ")
                                 .replacingOccurrences(of: "🔑", with: "Key concept: ")
                                 .replacingOccurrences(of: "1️⃣", with: "Step 1: ")
                                 .replacingOccurrences(of: "2️⃣", with: "Step 2: ")
                                 .replacingOccurrences(of: "3️⃣", with: "Step 3: ")
        
        let utterance = AVSpeechUtterance(string: cleanedText)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5 // Slower, clear reading speed for education
        
        synthesizer.speak(utterance)
    }
    
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
    
    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        Task { @MainActor in self.isSpeaking = true }
    }
    
    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        Task { @MainActor in self.isSpeaking = false }
    }
    
    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        Task { @MainActor in self.isSpeaking = false }
    }
}
