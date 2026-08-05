document.addEventListener('DOMContentLoaded', () => {

    /* ==========================================================================
       1. STICKY GLASS NAVBAR & MOBILE MENU
       ========================================================================== */
    const mainNav = document.getElementById('main-nav');
    const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
    const navLinks = document.getElementById('nav-links');

    // Sticky Scroll Observer
    window.addEventListener('scroll', () => {
        if (mainNav) {
            if (window.scrollY > 40) {
                mainNav.classList.add('scrolled');
            } else {
                mainNav.classList.remove('scrolled');
            }
        }
    });

    // Mobile Menu Toggle
    if (mobileMenuToggle && navLinks) {
        mobileMenuToggle.addEventListener('click', (e) => {
            e.stopPropagation();
            navLinks.classList.toggle('active');
        });

        navLinks.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                navLinks.classList.remove('active');
            });
        });

        document.addEventListener('click', (e) => {
            if (!navLinks.contains(e.target) && !mobileMenuToggle.contains(e.target)) {
                navLinks.classList.remove('active');
            }
        });
    }

    /* ==========================================================================
       2. NOTIFICATION TOAST HELPER
       ========================================================================== */
    const toast = document.getElementById('toast');
    const toastText = document.getElementById('toast-text');

    function showToast(message) {
        if (!toast || !toastText) return;
        toastText.textContent = message;
        toast.classList.add('show');
        setTimeout(() => {
            toast.classList.remove('show');
        }, 3500);
    }

    /* ==========================================================================
       3. PDF LEAD MAGNET DOWNLOAD HANDLING
       ========================================================================== */
    document.querySelectorAll('.io-btn-download').forEach(btn => {
        btn.addEventListener('click', function() {
            this.classList.add('blinking');
            const parent = this.closest('.resource-item');
            const guideTitle = parent ? parent.querySelector('span').textContent : 'Guide';
            showToast(`Downloading ${guideTitle}...`);
            setTimeout(() => {
                this.classList.remove('blinking');
            }, 1500);
        });
    });

    /* ==========================================================================
       4. INTERACTIVE BUDGET CALCULATOR
       ========================================================================== */
    const propCards = document.querySelectorAll('#calc-prop-grid .calc-card');
    const scopeCards = document.querySelectorAll('#calc-scope-grid .calc-card');
    const finishCards = document.querySelectorAll('#calc-finish-grid .calc-card');
    const areaSlider = document.getElementById('calc-area-slider');
    const areaDisplay = document.getElementById('area-val-display');
    const totalPriceDisplay = document.getElementById('calc-total-price');

    const summaryProp = document.getElementById('summary-prop');
    const summaryScope = document.getElementById('summary-scope');
    const summaryPackage = document.getElementById('summary-package');
    const summaryTime = document.getElementById('summary-time');
    const calcWaBtn = document.getElementById('calc-send-wa');

    function formatRupees(amount) {
        return new Intl.NumberFormat('en-IN', {
            maximumFractionDigits: 0,
            style: 'currency',
            currency: 'INR'
        }).format(amount);
    }

    function updateCalculator() {
        if (!areaSlider || !totalPriceDisplay) return;

        const activeProp = document.querySelector('#calc-prop-grid .calc-card.active');
        const activeScope = document.querySelector('#calc-scope-grid .calc-card.active');
        const activeFinish = document.querySelector('#calc-finish-grid .calc-card.active');

        if (!activeProp || !activeScope || !activeFinish) return;

        const basePrice = parseFloat(activeProp.getAttribute('data-base')) || 500000;
        const scopeMult = parseFloat(activeScope.getAttribute('data-mult')) || 1.0;
        const finishMult = parseFloat(activeFinish.getAttribute('data-mult')) || 1.0;
        const areaSqft = parseInt(areaSlider.value, 10) || 1000;

        // Area scaling factor normalized to 1000 sqft standard
        const areaFactor = 0.6 + (areaSqft / 1000) * 0.4;
        const calculatedBase = basePrice * scopeMult * finishMult * areaFactor;

        const minEstimate = Math.round(calculatedBase * 0.92 / 10000) * 10000;
        const maxEstimate = Math.round(calculatedBase * 1.15 / 10000) * 10000;

        // Format display
        areaDisplay.textContent = `${areaSqft.toLocaleString('en-IN')} Sq.Ft.`;
        totalPriceDisplay.textContent = `${formatRupees(minEstimate)} - ${formatRupees(maxEstimate)}`;

        const propLabel = activeProp.getAttribute('data-label') || 'Property';
        const scopeLabel = activeScope.getAttribute('data-label') || 'Turnkey';
        const finishLabel = activeFinish.getAttribute('data-label') || 'Premium';

        if (summaryProp) summaryProp.textContent = propLabel;
        if (summaryScope) summaryScope.textContent = scopeLabel;
        if (summaryPackage) summaryPackage.textContent = finishLabel;

        // Timeline estimate
        let timeline = '40 - 50 Days';
        if (areaSqft > 2000 || activeProp.getAttribute('data-value') === 'villa') {
            timeline = '60 - 90 Days';
        } else if (scopeMult < 0.5) {
            timeline = '25 - 35 Days';
        }
        if (summaryTime) summaryTime.textContent = timeline;
    }

    function setupCardSelection(cards) {
        cards.forEach(card => {
            card.addEventListener('click', () => {
                cards.forEach(c => c.classList.remove('active'));
                card.classList.add('active');
                updateCalculator();
            });
        });
    }

    if (propCards.length > 0) setupCardSelection(propCards);
    if (scopeCards.length > 0) setupCardSelection(scopeCards);
    if (finishCards.length > 0) setupCardSelection(finishCards);

    if (areaSlider) {
        areaSlider.addEventListener('input', updateCalculator);
    }

    // Initialize calculator on page load
    updateCalculator();

    // Send WhatsApp quote from calculator
    if (calcWaBtn) {
        calcWaBtn.addEventListener('click', () => {
            const activeProp = document.querySelector('#calc-prop-grid .calc-card.active');
            const activeScope = document.querySelector('#calc-scope-grid .calc-card.active');
            const activeFinish = document.querySelector('#calc-finish-grid .calc-card.active');
            const area = areaSlider ? areaSlider.value : '1000';
            const price = totalPriceDisplay ? totalPriceDisplay.textContent : 'Quote';

            const propName = activeProp ? activeProp.getAttribute('data-label') : 'Property';
            const scopeName = activeScope ? activeScope.getAttribute('data-label') : 'Full Interior';
            const finishName = activeFinish ? activeFinish.getAttribute('data-label') : 'Premium';

            const text = `Hello Asha Interiors! I generated an instant estimate on your website:

🏡 *Property Type:* ${propName}
📐 *Carpet Area:* ${area} Sq.Ft.
🛠️ *Scope:* ${scopeName}
✨ *Finish Package:* ${finishName}
💰 *Estimated Range:* ${price}

I would like to discuss this project and get a detailed layout plan!`;

            const whatsappURL = `https://wa.me/919561377769?text=${encodeURIComponent(text)}`;
            window.open(whatsappURL, '_blank');
            showToast('Opening WhatsApp with your project estimate...');
        });
    }

    /* ==========================================================================
       5. BEFORE & AFTER DRAG SLIDER
       ========================================================================== */
    const baContainer = document.getElementById('ba-slider-container');
    const baAfterBox = document.getElementById('ba-after-box');
    const baHandle = document.getElementById('ba-handle-line');

    if (baContainer && baAfterBox && baHandle) {
        let isDragging = false;

        function setSliderPos(x) {
            const rect = baContainer.getBoundingClientRect();
            let offsetX = x - rect.left;
            if (offsetX < 0) offsetX = 0;
            if (offsetX > rect.width) offsetX = rect.width;

            const pct = (offsetX / rect.width) * 100;
            baAfterBox.style.width = `${pct}%`;
            baHandle.style.left = `${pct}%`;
        }

        baContainer.addEventListener('mousedown', (e) => {
            isDragging = true;
            setSliderPos(e.clientX);
        });

        window.addEventListener('mousemove', (e) => {
            if (!isDragging) return;
            setSliderPos(e.clientX);
        });

        window.addEventListener('mouseup', () => {
            isDragging = false;
        });

        // Touch event support
        baContainer.addEventListener('touchstart', (e) => {
            isDragging = true;
            if (e.touches[0]) setSliderPos(e.touches[0].clientX);
        });

        window.addEventListener('touchmove', (e) => {
            if (!isDragging) return;
            if (e.touches[0]) setSliderPos(e.touches[0].clientX);
        });

        window.addEventListener('touchend', () => {
            isDragging = false;
        });
    }

    /* ==========================================================================
       6. PROJECT FILTERING & LIGHTBOX QUICK-VIEW MODAL
       ========================================================================== */
    const filterBtns = document.querySelectorAll('.filter-btn');
    const projectCards = document.querySelectorAll('.project-card');
    const modal = document.getElementById('project-modal');
    const modalCloseBtn = document.getElementById('modal-close-btn');

    const modalImg = document.getElementById('modal-img');
    const modalTag = document.getElementById('modal-tag');
    const modalTitle = document.getElementById('modal-title');
    const modalDesc = document.getElementById('modal-desc');

    filterBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            filterBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            const filterValue = btn.getAttribute('data-filter');

            projectCards.forEach(card => {
                const category = card.getAttribute('data-category');
                if (filterValue === 'all' || filterValue === category) {
                    card.style.display = '';
                    card.style.animation = 'fadeIn 0.5s ease forwards';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });

    // Modal view for project cards
    function openProjectModal(card) {
        if (!modal) return;
        const img = card.querySelector('.project-img');
        const title = card.querySelector('.project-title');
        const desc = card.querySelector('.project-desc');
        const category = card.getAttribute('data-category') || 'Residential';

        if (modalImg && img) modalImg.src = img.src;
        if (modalTitle && title) modalTitle.textContent = title.textContent;
        if (modalDesc && desc) modalDesc.textContent = desc.textContent;
        if (modalTag) modalTag.textContent = category.toUpperCase();

        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeModal() {
        if (!modal) return;
        modal.classList.remove('active');
        document.body.style.overflow = '';
    }

    projectCards.forEach(card => {
        card.style.cursor = 'pointer';
        card.addEventListener('click', (e) => {
            // If user clicks direct project page link, navigate
            if (e.target.classList.contains('project-link')) return;
            openProjectModal(card);
        });
    });

    if (modalCloseBtn) {
        modalCloseBtn.addEventListener('click', closeModal);
    }

    if (modal) {
        modal.addEventListener('click', (e) => {
            if (e.target === modal) closeModal();
        });
    }

    /* ==========================================================================
       7. FAQ ACCORDION TOGGLE
       ========================================================================== */
    const faqItems = document.querySelectorAll('.faq-item');

    faqItems.forEach(item => {
        const questionBtn = item.querySelector('.faq-question');
        if (questionBtn) {
            questionBtn.addEventListener('click', () => {
                const isActive = item.classList.contains('active');
                
                // Close other open accordion items
                faqItems.forEach(i => i.classList.remove('active'));

                if (!isActive) {
                    item.classList.add('active');
                }
            });
        }
    });

    /* ==========================================================================
       8. WHATSAPP CONSULTATION FORM DISPATCH
       ========================================================================== */
    const form = document.getElementById('wa-consultation-form');
    if (form) {
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const name = document.getElementById('form-name').value;
            const phone = document.getElementById('form-phone').value;
            const email = document.getElementById('form-email').value;
            const service = document.getElementById('form-service').value;
            const budget = document.getElementById('form-budget').value || 'Not specified';
            const date = document.getElementById('form-date').value || 'Not specified';
            const message = document.getElementById('form-message').value || 'No additional notes provided.';
            
            const whatsappNumber = '919561377769';
            const text = `✨ *NEW CONSULTATION REQUEST* ✨

👤 *Name:* ${name}
📞 *Phone:* ${phone}
✉️ *Email:* ${email}
🏡 *Service Required:* ${service}
💰 *Budget Range:* ${budget}
📅 *Preferred Date:* ${date}

📝 *Project Details:*
${message}`;

            const whatsappURL = `https://wa.me/${whatsappNumber}?text=${encodeURIComponent(text)}`;
            window.open(whatsappURL, '_blank');
            showToast('Thank you! Redirecting to WhatsApp consultation...');
            form.reset();
        });
    }

    /* ==========================================================================
       9. SMOOTH SCROLLING FOR ANCHOR LINKS
       ========================================================================== */
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const targetId = this.getAttribute('href');
            if (targetId === '#' || targetId === '') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                e.preventDefault();
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

});
