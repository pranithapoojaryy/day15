$path = "c:\Users\Pranitha\day15\index.html"
$content = Get-Content $path -Raw
$contact_html = @"
    <!-- Contact -->
    <section id="contact" class="py-5">
        <div class="container">
            <h2 class="section-title">Contact Us</h2>
            <div class="contact-box">
                <form id="contactForm" novalidate>
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Full Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="fullName" placeholder="Full Name" oninput="this.value = this.value.replace(/\d/g, '')" required>
                        <div class="invalid-feedback">
                            Please enter your full name.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
                        <input type="email" class="form-control" id="email" placeholder="Email Address" required>
                        <div class="invalid-feedback">
                            Please enter a valid email address.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone Number <span class="text-danger">*</span></label>
                        <input type="tel" class="form-control" id="phone" placeholder="Phone Number" pattern="\d{10}" inputmode="tel" oninput="this.value = this.value.replace(/\D/g, '')" maxlength="10" required>
                        <div class="invalid-feedback">
                            Please enter a valid 10-digit phone number.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Message <span class="text-danger">*</span></label>
                        <textarea class="form-control" rows="5" id="message" placeholder="Message" required></textarea>
                        <div class="invalid-feedback">
                            Please enter your message.
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">
                        Send Message
                    </button>
                </form>
            </div>
        </div>
    </section>

    <!-- Footer -->
"@

if ($content -notmatch "<!-- Contact -->") {
    $content = $content.Replace("    <!-- Footer -->", $contact_html)
    Set-Content -Path $path -Value $content -Encoding UTF8
    Write-Host "Contact section restored successfully."
} else {
    Write-Host "Contact section already exists."
}
