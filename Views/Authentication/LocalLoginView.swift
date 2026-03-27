import SwiftUI

struct LocalLoginView: View {
    @EnvironmentObject var authService: LocalAuthService
    @State private var name = ""
    @State private var isLoading = false
    @State private var nameIsFocused = false
    @State private var showWelcome = true
    @State private var animateGradient = false

    // Validation states
    private var nameIsValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private var canSubmit: Bool {
        nameIsValid
    }

    var body: some View {
        ZStack {
            // Animated gradient background
            LinearGradient(
                colors: [
                    Color.appBackground,
                    Color.surfaceBackground,
                    Color.appBackground
                ],
                startPoint: animateGradient ? .topLeading : .bottomLeading,
                endPoint: animateGradient ? .bottomTrailing : .topTrailing
            )
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient = true
                }
            }

            // Floating particles background
            GeometryReader { geometry in
                ForEach(0..<8, id: \.self) { i in
                    Circle()
                        .fill(Color.appPrimary.opacity(0.05))
                        .frame(width: CGFloat.random(in: 60...120))
                        .offset(
                            x: CGFloat.random(in: 0...geometry.size.width),
                            y: CGFloat.random(in: 0...geometry.size.height)
                        )
                        .blur(radius: 30)
                }
            }
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 40) {
                    Spacer(minLength: 60)

                    // Logo and branding
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(Color.appPrimary.opacity(0.2))
                                .frame(width: 100, height: 100)
                                .blur(radius: 20)

                            Image(systemName: "chevron.left.forwardslash.chevron.right")
                                .font(.system(size: 56, weight: .bold))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [Color.appPrimary, Color.appSecondary],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }
                        .scaleEffect(showWelcome ? 1 : 0.8)
                        .opacity(showWelcome ? 1 : 0)

                        Text("WebCraft")
                            .font(.system(size: 42, weight: .heavy, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.textPrimary, Color.textPrimary.opacity(0.8)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .scaleEffect(showWelcome ? 1 : 0.8)
                            .opacity(showWelcome ? 1 : 0)

                        Text("Start your web development journey")
                            .font(.system(size: 17))
                            .foregroundColor(.textSecondary)
                            .multilineTextAlignment(.center)
                            .scaleEffect(showWelcome ? 1 : 0.8)
                            .opacity(showWelcome ? 1 : 0)
                    }
                    .padding(.bottom, 20)

                    // Form card with glassmorphism
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 8) {
                            Text("Welcome")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.textPrimary)

                            Text("Enter your name to continue")
                                .font(.system(size: 14))
                                .foregroundColor(.textSecondary)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 8)

                        // Input fields
                        VStack(spacing: 16) {
                            // Name field
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Your Name")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.textSecondary)

                                HStack(spacing: 12) {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 16))
                                        .foregroundColor(nameIsFocused ? .appPrimary : .textSecondary)

                                    TextField("Enter your full name", text: $name)
                                        .textFieldStyle(.plain)
                                        .foregroundColor(.textPrimary)
                                        .autocorrectionDisabled()
                                        .textInputAutocapitalization(.words)
                                        .submitLabel(.go)
                                        .onSubmit {
                                            handleSubmit()
                                        }

                                    if !name.isEmpty {
                                        Image(systemName: nameIsValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                                            .font(.system(size: 16))
                                            .foregroundColor(nameIsValid ? .appSuccess : .appError)
                                    }
                                }
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(Color.textPrimary.opacity(0.05))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 14)
                                                .stroke(
                                                    nameIsFocused ? Color.appPrimary : Color.textPrimary.opacity(0.1),
                                                    lineWidth: nameIsFocused ? 2 : 1
                                                )
                                        )
                                )
                                .shadow(color: nameIsFocused ? Color.appPrimary.opacity(0.3) : .clear, radius: 8, x: 0, y: 4)
                            }
                        }

                        // Error message
                        if let error = authService.errorMessage {
                            HStack(spacing: 10) {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.appError)
                                .padding(.leading, 12)
                                Text(error)
                                    .font(.system(size: 14))
                                    .foregroundColor(.appError)
                                Spacer()
                            }
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.appError.opacity(0.15))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.appError.opacity(0.3), lineWidth: 1)
                                    )
                            )
                            .transition(.move(edge: .top).combined(with: .opacity))
                        }

                        // Submit button
                        Button {
                            handleSubmit()
                        } label: {
                            HStack(spacing: 10) {
                                if isLoading {
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                        .tint(.white)
                                } else {
                                    Text("Start Learning")
                                        .font(.system(size: 17, weight: .semibold))
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: 15, weight: .semibold))
                                }
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(
                                    colors: canSubmit ? [Color.appPrimary, Color.appSecondary] : [Color.gray.opacity(0.3), Color.gray.opacity(0.3)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .shadow(color: canSubmit ? Color.appPrimary.opacity(0.4) : .clear, radius: 15, x: 0, y: 8)
                        }
                        .disabled(!canSubmit || isLoading)
                        .scaleEffect(canSubmit ? 1 : 0.98)
                        .animation(.spring(response: 0.3), value: canSubmit)
                        .accessibilityLabel("Create account and start learning")
                        .accessibilityHint(canSubmit ? "Double tap to continue" : "Fill in your name to continue")
                    }
                    .padding(28)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.ultraThinMaterial)
                            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 15)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(
                                LinearGradient(
                                    colors: [Color.textPrimary.opacity(0.2), Color.textPrimary.opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
                    .padding(.horizontal, 24)

                    // Help text
                    VStack(spacing: 8) {
                        HStack(spacing: 6) {
                            Image(systemName: "lock.shield.fill")
                                .font(.system(size: 12))
                                .foregroundColor(.textTertiary)
                            Text("Your data is stored locally and never leaves your device")
                                .font(.system(size: 12))
                                .foregroundColor(.textTertiary)
                        }

                        HStack(spacing: 6) {
                            Image(systemName: "checkmark.seal.fill")
                                .font(.system(size: 12))
                                .foregroundColor(.textTertiary)
                            Text("Free forever • No email required • Start immediately")
                                .font(.system(size: 12))
                                .foregroundColor(.textTertiary)
                        }
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 20)

                    Spacer(minLength: 40)
                }
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.1)) {
                showWelcome = true
            }
        }
    }

    // MARK: - Actions

    private func handleSubmit() {
        guard canSubmit else { return }
        // Dismiss keyboard
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        withAnimation {
            isLoading = true
            authService.errorMessage = nil
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let success = authService.login(name: name)

            withAnimation {
                isLoading = false
            }

            if success {
                HapticManager.shared.trigger(.success)
            } else {
                HapticManager.shared.trigger(.error)
            }
        }
    }
}

#Preview {
    LocalLoginView()
        .environmentObject(LocalAuthService.shared)
}
