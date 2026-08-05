document.addEventListener('DOMContentLoaded', () => {
    // Mobile Menu Toggle
    const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
    const navLinks = document.getElementById('nav-links');

    if (mobileMenuToggle && navLinks) {
        mobileMenuToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
    }

    // Project Filtering Logic
    const filterBtns = document.querySelectorAll('.filter-btn');
    const projectCards = document.querySelectorAll('.project-card');

    filterBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            // Remove active class from all buttons
            filterBtns.forEach(b => b.classList.remove('active'));
            // Add active class to clicked button
            btn.classList.add('active');

            const filterValue = btn.getAttribute('data-filter');

            projectCards.forEach(card => {
                const category = card.getAttribute('data-category');
                
                if (filterValue === 'all' || filterValue === category) {
                    card.style.display = 'block';
                    // Optional: Add a small animation here
                    card.style.animation = 'fadeIn 0.5s ease forwards';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });

    // WhatsApp Form Submission
    const form = document.getElementById('wa-consultation-form');
    if (form) {
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            
            // Collect data
            const name = document.getElementById('form-name').value;
            const phone = document.getElementById('form-phone').value;
            const email = document.getElementById('form-email').value;
            const service = document.getElementById('form-service').value;
            const budget = document.getElementById('form-budget').value || 'Not specified';
            const date = document.getElementById('form-date').value || 'Not specified';
            const message = document.getElementById('form-message').value || 'No message provided';
            
            // Format WhatsApp Message
            const whatsappNumber = '919823577149';
            const text = `Hello! I would like to book a free consultation. Here are my details:

*Name:* ${name}
*Phone:* ${phone}
*Email:* ${email}
*Service:* ${service}
*Budget Range:* ${budget}
*Preferred Date:* ${date}

*Message:*
${message}`;

            // Create WhatsApp Link and redirect
            const whatsappURL = `https://wa.me/${whatsappNumber}?text=${encodeURIComponent(text)}`;
            
            window.open(whatsappURL, '_blank');
            form.reset();
        });
    }

    // Smooth Scrolling for Anchor Links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                e.preventDefault();
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    // IO Download Button Blink Effect
    document.querySelectorAll('.io-btn-download').forEach(btn => {
        btn.addEventListener('click', function() {
            this.classList.add('blinking');
            // Remove class after animation completes (4 blinks * 0.3s = 1.2s)
            setTimeout(() => {
                this.classList.remove('blinking');
            }, 1200);
        });
    });

    // Make entire project cards clickable
    document.querySelectorAll('.project-card').forEach(card => {
        card.style.cursor = 'pointer';
        card.addEventListener('click', (e) => {
            if (e.target.closest('a')) return;
            const link = card.querySelector('.project-link');
            if (link) {
                const href = link.getAttribute('href');
                if (href && href !== '#') {
                    window.location.href = href;
                }
            }
        });
    });
});
