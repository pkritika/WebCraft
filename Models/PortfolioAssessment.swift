import Foundation

struct PortfolioAssessment: Identifiable {
    let id: Int
    let title: String
    let description: String
    let icon: String
    let color: String // hex color
    let htmlMarker: String

    // Structured instruction fields
    let whatYoureBuilding: String
    let steps: [String]
    let expectedResult: String
    let bonusChallenge: String

    // Code starters
    let starterHTML: String
    let starterCSS: String
    let starterJS: String?

    static let allAssessments: [PortfolioAssessment] = [

        // ── Module 1: About Me Section ──────────────────────────
        PortfolioAssessment(
            id: 1,
            title: "Home Section",
            description: "Create your portfolio's first page with your name and a short intro",
            icon: "house.fill",
            color: "#6366F1",
            htmlMarker: "<!-- HEADER -->",
            whatYoureBuilding: "Create the very first page of your portfolio with your name, a big welcome heading, and a short paragraph about yourself.",
            steps: [
                "Replace the placeholder `<h1>` with your own name.",
                "Change the `<h2>` to your own welcome message.",
                "Write 2–3 sentences about who you are in the first `<p>`.",
                "Add your grade and one fun fact in the second `<p>`."
            ],
            expectedResult: "Your browser shows a plain white page with your name as the biggest heading at the top, a welcome message below it, and two paragraphs of text about you.",
            bonusChallenge: "Add an `<h3>` \"My Favourite Things\" and use three `<p>` tags to list your top three hobbies, foods, or movies.",
            starterHTML: """
            <!-- HEADER -->
            <section class="header-section">

              <!-- TODO: YOUR TURN — Replace "Your Name Here" with your actual name -->
              <h1>Your Name Here</h1>

              <!-- TODO: YOUR TURN — Change this to your own welcome message -->
              <h2>Welcome to my portfolio!</h2>

              <!-- TODO: YOUR TURN — Write 2–3 sentences about who you are -->
              <p>I am a student who loves learning and creating new things.</p>

              <!-- TODO: YOUR TURN — Add your grade and one fun fact about yourself -->
              <p>I'm in grade 10 and I enjoy coding!</p>

            </section>
            """,
            starterCSS: """
            /* ✨ Module 1 — basic page styling */
            body {
                font-family: Arial, Helvetica, sans-serif;
                background: #ffffff;
                color: #222222;
                line-height: 1.6;
                padding: 20px;
            }
            h1 { font-size: 2.5rem; color: #1E1B4B; margin-bottom: 8px; }
            h2 { font-size: 1.4rem; color: #3730A3; margin-bottom: 12px; }
            p  { font-size: 1rem; margin-bottom: 10px; }
            """,
            starterJS: nil
        ),

        // ── Module 2: Links & Favorites ──────────────────────
        PortfolioAssessment(
            id: 2,
            title: "About Me",
            description: "Add a section to write more about yourself and your favorite sites with CSS styling and special characters",
            icon: "link.circle.fill",
            color: "#EC4899",
            htmlMarker: "<!-- LINKS -->",
            whatYoureBuilding: "Add a \"My Favorites\" section with links to sites you love, and make it pop with CSS colors and fonts.",
            steps: [
                "Add an `<h2>` heading for your section (try \"My Favorites\" or \"Links I Love\").",
                "Add at least 3 links using `<a href=\"...\" class=\"fav-link\">` to your favorite websites.",
                "In the CSS tab, change the section background color and add padding.",
                "Style your heading with a custom color using the CSS `color` property.",
            ],
            expectedResult: "Your page now has a colorful section with clickable links to your favorite sites, styled headings",
            bonusChallenge: "Add a hover effect: `.fav-link:hover { color: #e91e8c; text-decoration: underline; }` to make links change when you move your mouse over them!",
            starterHTML: """
            <!-- LINKS -->
            <section class="links-section">

              <!-- TODO: YOUR TURN — Change "My Favorites" to your own section title -->
              <h2 class="links-title">My Favorites</h2>

              <!-- TODO: YOUR TURN — Replace these with your real favorite sites! -->
              <p>
                <a href="https://github.com" class="fav-link" target="_blank">GitHub</a>
                <span class="link-separator"> • </span>
                <a href="https://scratch.mit.edu" class="fav-link" target="_blank">Scratch</a>
                <span class="link-separator"> • </span>
                <a href="https://developer.mozilla.org" class="fav-link" target="_blank">MDN Web Docs</a>
                <!-- TODO: YOUR TURN — Add 2 more links with the same pattern -->
              </p>


            </section>
            """,
            starterCSS: """
            /* ---- About Me---- */

            /* STEP 1: Give your section a background color */
            .links-section {
              /* TODO: YOUR TURN — Change background-color to your favorite color!
                 Try: #fef3f2  or  #fff7ed  or  #fef3c7 */
              background-color: #fff1f2;
              padding: 40px;
              margin-top: 20px;
              border-radius: 12px;
            }

            /* STEP 2: Style your section heading */
            .links-title {
              /* TODO: YOUR TURN — Pick a color for your heading, try #ec4899 */
              color: #ec4899;
              font-family: Arial, sans-serif;
              font-size: 1.8rem;
              margin-bottom: 16px;
            }

            /* STEP 3: Style your paragraph text */
            /* TODO: YOUR TURN — Change font-size, try: 18px */
            .links-section p {
              font-size: 16px;
              line-height: 1.8;
            }

            /* STEP 4: Style your links */
            .fav-link {
              color: #be185d;
              text-decoration: none;
              font-weight: bold;
              /* TODO: YOUR TURN — Try changing the color! */
            }

            .link-separator {
              color: #be185d;
              margin: 0 8px;
            }

            /* BONUS: Hover effect */
            /* TODO: YOUR TURN — Uncomment the block below for a hover effect!
            .fav-link:hover {
              color: #e91e8c;
              text-decoration: underline;
            }
            */

            .links-footer {
              margin-top: 24px;
              font-size: 14px;
              color: #666;
            }
            """,
            starterJS: nil
        ),

        // ── Module 3: Skills Section ────────────────────────────
        PortfolioAssessment(
            id: 3,
            title: "Skills Section",
            description: "Add a skills section using CSS classes, span, and div",
            icon: "paintbrush.fill",
            color: "#0E7490",
            htmlMarker: "<!-- SKILLS -->",
            whatYoureBuilding: "Add a \"My Skills\" section with colorful skill badges that look like professional tags or chips.",
            steps: [
                "Add a `<div class=\"skills-section\">` with an `<h2>` \"My Skills\" inside it.",
                "Use `<span class=\"skill\">` for each skill (e.g. HTML, CSS, Drawing).",
                "In the CSS tab, style `.skills-section` with a background color and padding.",
                "Style `.skill` with a background color, `border-radius`, and padding so each looks like a badge chip.",
                "Give one special skill a unique ID `id=\"skill-favorite\"` and style it differently using `#skill-favorite { }`."
            ],
            expectedResult: "Your page now has a \"My Skills\" section with colorful badge-style labels for each skill. Each skill chip has its own background color and padding.",
            bonusChallenge: "Add more advanced skills and style them with a gradient: `background: linear-gradient(135deg, #667eea, #764ba2);` for a pro look!",
            starterHTML: """
            <!-- SKILLS -->
            <div class="skills-section">

              <h2>My Skills</h2>

              <div class="skills-list">
                <!-- TODO: YOUR TURN — Replace these with your real skills!
                     Copy the <span> pattern to add more. -->
                <span class="skill">HTML</span>
                <span class="skill">CSS</span>
                <span class="skill" id="skill-favorite">JavaScript</span>
                <!-- TODO: YOUR TURN — Add at least 3 more skill chips below -->

              </div>

            </div>
            """,
            starterCSS: """
            /* ---- SKILLS SECTION ---- */

            /* STEP 1: Style the skills section background */
            .skills-section {
              /* TODO: YOUR TURN — Change background-color, try #e0f2fe or #f8fafc */
              background-color: #f0f9ff;
              padding: 40px;
              margin-top: 20px;
              border-radius: 12px;
            }

            .skills-section h2 {
              color: #0E7490;
              margin-bottom: 20px;
            }

            /* STEP 2: Lay out the skill chips in a row that wraps */
            .skills-list {
              display: flex;
              flex-wrap: wrap;
              gap: 12px;
              margin-top: 16px;
            }

            /* STEP 3: Style each skill chip */
            .skill {
              /* TODO: YOUR TURN — Pick a background-color for your chips, try #0891b2 */
              background-color: #0891b2;

              /* TODO: YOUR TURN — Change text color for readability */
              color: #ffffff;

              /* TODO: YOUR TURN — Change border-radius to make them rounder, try 20px */
              border-radius: 8px;

              padding: 8px 16px;
              font-weight: bold;
              font-size: 14px;
            }

            /* STEP 4: Style your favorite skill differently using its ID */
            #skill-favorite {
              /* TODO: YOUR TURN — Make this skill stand out! Try a different color */
              background-color: #f59e0b;
              color: #1a1a1a;
            }

            /* BONUS: Add a subtle hover effect */
            /* TODO: YOUR TURN — Uncomment to add hover effects!
            .skill:hover {
              transform: translateY(-2px);
              box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            }
            */
            """ ,
            starterJS: nil
        ),

        // ── Module 4: Photo Gallery - DISABLED ─────────────────────────────

        // ── Module 5: Resume / CV Table ─────────────────────────
        PortfolioAssessment(
            id: 5,
            title: "Resume / CV Table",
            description: "Add an experience table, an audio player, and format lists properly",
            icon: "tablecells.fill",
            color: "#065F46",
            htmlMarker: "<!-- TABLE -->",
            whatYoureBuilding: "Add a \"My Experience\" table that acts like a mini-resume — showing school activities, achievements, and hobbies in a neat, organized grid.",
            steps: [
                "Add an `<h2>` \"My Experience\" and a `<table>` with at least 4 rows. Use `<th>` for headers (Activity, Description, Year) and `<td>` for data.",
                "Fill the table with real activities: clubs, sports, awards, and classes you enjoy.",
                "Add a \"What I'm Listening To\" `<h2>` with an HTML5 `<audio controls src=\"...\">` tag below it.",
                "Your skills are shown in a `<ul>` bullet list and favorite sites in an `<ol>` numbered list — see how HTML creates structure!"
            ],
            expectedResult: "Your portfolio now has a table with bold header labels and neatly arranged rows of your activities. There's also a small audio player visitors can press play on, and your skills and links are formatted as proper lists.",
            bonusChallenge: "Add a `<video>` tag below the audio player to showcase a project demo or favorite video. Use `<video controls width=\"400\">` with a `<source src=\"...\">` inside!",
            starterHTML: """
            <!-- TABLE -->
            <div class="table-section">

              <h2 class="table-title">My Experience 📋</h2>

              <table class="resume-table">
                <thead>
                  <tr>
                    <th>Activity</th>
                    <th>Description</th>
                    <th>Year</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- TODO: YOUR TURN — Replace these rows with your real activities!
                       Think: clubs, sports, awards, classes you enjoy. -->
                  <tr>
                    <td>Coding Club</td>
                    <td>Built my first website</td>
                    <td>2024</td>
                  </tr>
                  <tr>
                    <td>Art Class</td>
                    <td>Won the school art competition</td>
                    <td>2023</td>
                  </tr>
                  <!-- TODO: YOUR TURN — Add at least 2 more rows below -->

                </tbody>
              </table>

              <!-- STEP 3: Audio Player -->
              <h2 class="table-title">What I'm Listening To 🎵</h2>
              <!-- TODO: YOUR TURN — Replace the src with a link to your own audio file! -->
              <audio class="audio-player" controls src="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3">
                Your browser does not support the audio element.
              </audio>

              <!-- STEP 4: Skills as a bullet list -->
              <h2 class="table-title">My Skills 🛠️</h2>
              <ul class="skills-ul">
                <li>HTML</li>
                <li>CSS</li>
                <li>Problem Solving</li>
                <!-- TODO: YOUR TURN — Add your own skills here -->
              </ul>

              <!-- STEP 5: Links as a numbered list -->
              <h2 class="table-title">My Favorite Sites 🔗</h2>
              <ol class="links-ol">
                <li><a href="https://scratch.mit.edu" target="_blank">Scratch</a></li>
                <li><a href="https://github.com" target="_blank">GitHub</a></li>
                <!-- TODO: YOUR TURN — Add 2 more of your favorite sites here -->
              </ol>

            </div>
""",
            starterCSS: """
            /* ---- RESUME / CV TABLE ---- */

            /* STEP 1: Section background and spacing */
            .table-section {
              background-color: #f0fdf4;
              padding: 40px;
              margin-top: 20px;
              border-radius: 12px;
            }

            .table-title {
              color: #065F46;
              margin-top: 32px;
              margin-bottom: 12px;
            }

            /* STEP 2: Style the table itself */
            .resume-table {
              width: 100%;
              border-collapse: collapse;
              margin-bottom: 16px;
            }

            /* STEP 3: Style the header row */
            .resume-table th {
              background-color: #065F46;
              color: white;
              padding: 12px 16px;
              text-align: left;
            }

            /* STEP 4: Style the data cells */
            .resume-table td {
              padding: 10px 16px;
              border-bottom: 1px solid #d1fae5;
              /* TODO: YOUR TURN — Change the color of your table text, try #1a1a2e */
              color: #333333;
            }

            /* STEP 5: Alternating row colors — zebra striping! */
            /* TODO: YOUR TURN — Uncomment the block below to add zebra stripes!
            .resume-table tr:nth-child(even) {
              background-color: #ecfdf5;
            }
            */

            /* STEP 6: Audio player */
            .audio-player {
              display: block;
              margin-top: 8px;
              margin-bottom: 16px;
              width: 100%;
              max-width: 400px;
            }

            /* STEP 7: List styles */
            .skills-ul, .links-ol {
              padding-left: 24px;
              line-height: 2;
            }

            .links-ol a {
              color: #065F46;
              font-weight: 500;
            }

            /* BONUS: style your list links on hover */
            /* TODO: YOUR TURN — Uncomment to add a hover effect!
            .links-ol a:hover {
              color: #10b981;
              text-decoration: underline;
            }
            */
            """ ,
            starterJS: nil
        ),

        // ── Module 6: Navigation & Footer ─────────────────────────────
        PortfolioAssessment(
            id: 6,
            title: "Navigation & Footer",
            description: "Add a sticky navigation bar and footer to complete your portfolio",
            icon: "rectangle.3.group.fill",
            color: "#5B21B6",
            htmlMarker: "<!-- LAYOUT-NAV -->",
            whatYoureBuilding: "Add a professional navigation bar that sticks to the top as you scroll, and a footer at the bottom. These will wrap around all your previous sections to create a complete portfolio website.",
            steps: [
                "Add a `<header class=\"site-nav\">` with your name and navigation links to your sections.",
                "In CSS, use `position: sticky; top: 0;` on the header so it stays visible when scrolling.",
                "Add a `<footer class=\"site-footer\">` with a copyright line and your name.",
                "Style the navigation links to change color on hover.",
                "The nav bar will automatically appear above all your previous sections!"
            ],
            expectedResult: "Your portfolio now has a sticky navigation bar at the top that follows you as you scroll, and a footer at the bottom. Your About, Links, Skills, and Experience sections from previous modules are all organized beautifully between them!",
            bonusChallenge: "Add `z-index: 100` and `backdrop-filter: blur(8px)` to your sticky header for a frosted-glass effect that looks amazing when scrolling!",
            starterHTML: """
            <!-- LAYOUT-NAV -->

            <!-- STEP 1: Add your navigation header here -->
            <header class="site-nav">

              <!-- TODO: YOUR TURN — Replace "Your Name" with your actual name -->
              <nav class="nav-links">
                <!-- We gave you two links to start — add more below! -->
                <a href="#header">Home</a>
                <a href="#about">About Me</a>
                <!-- TODO: YOUR TURN — Add more links, e.g. <a href="#skills">Skills</a> -->
              </nav>

            </header>

            <!-- STEP 2: Add your footer here -->
            <footer class="site-footer">

              <!-- TODO: YOUR TURN — Add a copyright line with your name and year -->
              <p>&copy; 2025 Your Name | Built with HTML &amp; CSS</p>

            </footer>
            """,
            starterCSS: """
            /* ---- NAVIGATION & FOOTER ---- */

            /* STEP 1: Style your navigation header */
            .site-nav {
              /* TODO: YOUR TURN — Add position: sticky; top: 0; to make it stick! */

              /* TODO: YOUR TURN — Set a background-color for your nav bar */

              /* TODO: YOUR TURN — Use display: flex; to lay out your nav items */

              /* TODO: YOUR TURN — Add padding and any other styles you like */
            }

            /* STEP 2: Style your brand / name */
            .nav-brand {
              /* TODO: YOUR TURN — Set font-size, font-weight, color */
            }

            /* STEP 3: Style the nav links container */
            .nav-links {
              /* TODO: YOUR TURN — Try display: flex; and gap: 24px; */
            }

            /* STEP 4: Style individual nav links */
            .nav-links a {
              /* TODO: YOUR TURN — Remove underline with text-decoration: none; */
              /* TODO: YOUR TURN — Pick a color and font-weight */
            }

            /* STEP 5: Hover effect */
            .nav-links a:hover {
              /* TODO: YOUR TURN — Change the color or background on hover! */
            }

            /* STEP 6: Style your footer */
            .site-footer {
              /* TODO: YOUR TURN — Add background-color, color, padding, text-align */
            }

            /* BONUS: Smooth scrolling
            html {
              scroll-behavior: smooth;
            }
            */
            """,
            starterJS: nil
        ),

        // ── Module 7: Contact Form ──────────────────────────────
        PortfolioAssessment(
            id: 7,
            title: "Contact Form",
            description: "Add a \"Contact Me\" form so visitors can get in touch with you",
            icon: "envelope.fill",
            color: "#1E40AF",
            htmlMarker: "<!-- CONTACT -->",
            whatYoureBuilding: "Add a \"Contact Me\" section at the bottom of your portfolio with a fully styled HTML form so visitors can send you their name, email, and a message.",
            steps: [
                "Add an `<h2>` \"Contact Me\" and a `<form method=\"post\" class=\"contact-form\">` tag.",
                "Add a name input: `<input type=\"text\" name=\"name\" class=\"form-input\">` with a `<label>` above it.",
                "Add an email input: `<input type=\"email\" name=\"email\" class=\"form-input\">`. The browser validates the format automatically!",
                "Add a `<textarea name=\"message\" rows=\"5\" class=\"form-input\">` for messages.",
                "Add a submit button: `<input type=\"submit\" value=\"Send Message\" class=\"submit-btn\">`."
            ],
            expectedResult: "Your portfolio is complete! Visitors can scroll down to a styled contact form. They can type their name, enter an email, choose a subject from a dropdown, type a message, and click \"Send Message\". (Note: This is a demo form — in a real site, you'd need server-side code to process submissions.)",
            bonusChallenge: "Add a `required` attribute to the name, email, and message fields — the browser will automatically block submission if they're left empty! Then add `maxlength=\"500\"` to the textarea to limit message length.",
            starterHTML: """
            <!-- CONTACT -->
            <section id="contact" class="contact-section">

              <!-- TODO: YOUR TURN — Change "Contact Me" to your own heading if you like! -->
              <h2 class="contact-title">Contact Me</h2>
              <p class="contact-subtitle">Have a question or want to work together? Fill out the form and I'll get back to you!</p>

              <form class="contact-form" method="post" action="#">

                <!-- STEP 2: Name field -->
                <label class="form-label" for="name">Your Name</label>
                <input class="form-input" type="text" id="name" name="name" placeholder="Your name" />

                <!-- STEP 3: Email field -->
                <label class="form-label" for="email">Your Email</label>
                <!-- TODO: YOUR TURN — Add class="form-input" so it matches the form style! -->
                <input class="form-input" type="email" id="email" name="email" placeholder="your@email.com" />

                  <!-- TODO: YOUR TURN — Add at least 1 more <option> choice below -->

                </select>

                <!-- STEP 5: Message textarea -->
                <label class="form-label" for="message">Your Message</label>
                <!-- TODO: YOUR TURN — Add class="form-input" so it matches the form style! -->
                <textarea class="form-input" id="message" name="message" rows="5" placeholder="Type your message here..."></textarea>

                <!-- STEP 6: Submit button -->
                <input class="submit-btn" type="submit" value="Send Message 🚀" />

              </form>

            </section>
""",
            starterCSS: """
            /* ---- CONTACT FORM ---- */

            /* STEP 1: Section background and spacing */
            .contact-section {
              background-color: #eff6ff;
              padding: 60px 40px;
              margin-top: 40px;
              border-radius: 12px;
              /* TODO: YOUR TURN — Try changing background-color to your favorite color! */
            }

            .contact-title {
              color: #1E40AF;
              font-size: 2rem;
              margin-bottom: 8px;
            }

            .contact-subtitle {
              color: #555;
              margin-bottom: 32px;
              line-height: 1.6;
            }

            /* STEP 2: Stack the form fields vertically */
            .contact-form {
              display: flex;
              flex-direction: column;
              gap: 12px;
              max-width: 600px;
            }

            /* STEP 3: Label styling */
            .form-label {
              font-weight: bold;
              color: #1E40AF;
              font-size: 0.95rem;
              margin-top: 8px;
            }

            /* STEP 4: Shared style for all inputs, select, and textarea */
            .form-input {
              padding: 12px 16px;
              border: 2px solid #bfdbfe;
              border-radius: 8px;
              font-size: 1rem;
              font-family: Arial, sans-serif;
              outline: none;
              transition: border-color 0.2s;
              /* TODO: YOUR TURN — Try changing the border color */
            }

            .form-input:focus {
              border-color: #1E40AF;
              box-shadow: 0 0 0 3px rgba(30, 64, 175, 0.1);
            }

            textarea.form-input {
              resize: vertical;
              min-height: 100px;
            }

            /* STEP 5: Submit button */
            .submit-btn {
              padding: 14px 24px;
              background-color: #1E40AF;
              color: white;
              border: none;
              border-radius: 8px;
              font-size: 1.1rem;
              font-weight: bold;
              cursor: pointer;
              margin-top: 12px;
              transition: all 0.2s;
              /* TODO: YOUR TURN — Try changing background-color to your favorite color! */
            }

            /* BONUS: Hover effect on the submit button */
            .submit-btn:hover {
              background-color: #1d4ed8;
              transform: translateY(-2px);
              box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3);
            }

            .submit-btn:active {
              transform: translateY(0);
            }
            """,
            starterJS: nil
        )
    ]
}
