<?php
/**
 * The front page template file
 */
get_header(); ?>

<!-- NEW HERO SECTION -->
<section class="new-hero">
    <div class="hero-bg-image">
        <img src="<?php echo get_template_directory_uri(); ?>/assets/images/hero_sofa_image_1782542548819.png" alt="Luxury Sofa Room">
    </div>

    <div class="hero-overlay"></div>
    
    <nav class="top-nav-new">
        <?php 
            if ( has_nav_menu( 'primary' ) ) {
                wp_nav_menu( array(
                    'theme_location' => 'primary',
                    'container'      => false,
                ) );
            } else {
                echo '<ul><li><a href="#projects">Projects</a></li><li><a href="#about">About</a></li><li><a href="#services">Services</a></li><li><a href="#contact">Contact</a></li></ul>';
            }
        ?>
        <a href="#contact" class="btn-enquiry">Enquiry &rarr;</a>
    </nav>

    <div class="hero-content-new">
        <div class="hero-text-new">
            <h1 class="primary-heading-new">HK Interior</h1>
            <p class="sub-text-new">
                We create timeless, functional and inspiring interiors<br>
                that reflect your personality and elevate the way you<br>
                live, work and experience every space.
            </p>
            <a href="#contact" class="btn-dark">Book Free Consultation &rarr;</a>
        </div>
    </div>
</section>

<!-- PHILOSOPHY / CONFIGURATOR STRIP -->
<section class="philosophy-strip">
    <div class="philosophy-strip-content">
        <h2 class="strip-heading">Design That Tells Your Story</h2>
        <div class="strip-subheading">OUR PHILOSOPHY <span class="line"></span></div>
        
        <div class="strip-features">
            <div class="strip-feat">
                <i class="ph ph-cube"></i>
                <span>Client Centric<br>Approach</span>
            </div>
            <div class="strip-feat">
                <i class="ph ph-palette"></i>
                <span>Timeless &<br>Sustainable</span>
            </div>
            <div class="strip-feat">
                <i class="ph ph-armchair"></i>
                <span>Transparent<br>Communication</span>
            </div>
            <div class="strip-feat">
                <i class="ph ph-ruler"></i>
                <span>On-Time<br>Delivery</span>
            </div>
        </div>
    </div>
    <div class="philosophy-strip-image">
        <div class="strip-img-wrapper">
            <img src="<?php echo get_template_directory_uri(); ?>/assets/images/project_living_room_1782542599740.png" alt="Interior View">
        </div>
        <a href="<?php echo esc_url( home_url( '/carousel' ) ); ?>" class="strip-accent-box" style="text-decoration: none; cursor: pointer;">
            <div class="circle-diagram">
                <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="50" cy="50" r="40" stroke="#7a2a19" stroke-width="1" fill="none" opacity="0.3"/>
                    <circle cx="50" cy="50" r="30" stroke="#7a2a19" stroke-width="1" fill="none" opacity="0.3"/>
                    <line x1="50" y1="10" x2="50" y2="90" stroke="#7a2a19" stroke-width="1" opacity="0.3"/>
                    <line x1="10" y1="50" x2="90" y2="50" stroke="#7a2a19" stroke-width="1" opacity="0.3"/>
                </svg>
            </div>
            <p>Precision. Style.<br>Perfection.</p>
        </a>
    </div>
</section>

<!-- PROJECTS GRID -->
<section id="projects" class="featured-projects">
    <div class="container">
        <div class="section-header text-center">
            <span class="section-over-title">FEATURED INTERIOR PROJECTS</span>
            <h2 class="section-title">Spaces We Are Proud Of</h2>
            <div class="title-divider"></div>
        </div>
        
        <div class="filter-tabs">
            <button class="filter-btn active" data-filter="all">All</button>
            <a href="<?php echo esc_url( home_url( '/residential' ) ); ?>" class="filter-btn" style="text-decoration:none; display:inline-block; line-height: normal; box-sizing: border-box; text-align: center;">Residential</a>
            <button class="filter-btn" data-filter="commercial">Commercial</button>
            <button class="filter-btn" data-filter="villa">Villa</button>
            <button class="filter-btn" data-filter="kitchen">Kitchen</button>
            <button class="filter-btn" data-filter="office">Office</button>
        </div>

        <div class="projects-grid">
            <div class="project-card" data-category="residential">
                <div class="project-img-wrapper">
                    <img src="<?php echo get_template_directory_uri(); ?>/assets/images/project_living_room_1782542599740.png" alt="Modern Luxury Living Room" class="project-img">
                </div>
                <div class="project-info">
                    <h3 class="project-title">Modern Luxury Living Room</h3>
                    <p class="project-desc">Warm neutrals, layered textures, and timeless design.</p>
                    <a href="#" class="project-link">View Project &rarr;</a>
                </div>
            </div>
            
            <div class="project-card" data-category="kitchen">
                <div class="project-img-wrapper">
                    <img src="<?php echo get_template_directory_uri(); ?>/assets/images/project_kitchen_1782542611167.png" alt="Contemporary Modular Kitchen" class="project-img">
                </div>
                <div class="project-info">
                    <h3 class="project-title">Contemporary Modular Kitchen</h3>
                    <p class="project-desc">Smart storage, elegant finishes and perfect workflow.</p>
                    <a href="#" class="project-link">View Project &rarr;</a>
                </div>
            </div>

            <div class="project-card" data-category="residential">
                <div class="project-img-wrapper">
                    <img src="<?php echo get_template_directory_uri(); ?>/assets/images/project_bedroom_1782542622882.png" alt="Elegant Master Bedroom" class="project-img">
                </div>
                <div class="project-info">
                    <h3 class="project-title">Elegant Master Bedroom</h3>
                    <p class="project-desc">A calm retreat with soft lighting and rich materials.</p>
                    <a href="#" class="project-link">View Project &rarr;</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- TESTIMONIALS & REMAINDER -->
<section class="testimonials-section">
    <div class="container">
        <span class="section-over-title">CLIENT TESTIMONIALS</span>
        <h2 class="section-title">What Our Clients Say</h2>
        
        <div class="testimonials-grid">
            <div class="testimonial-card">
                <div class="stars"><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i><i class="ph-fill ph-star"></i></div>
                <p class="quote">"HK Interior Designs completely transformed our flat into a beautiful, functional space. Highly professional team!"</p>
                <div class="client-info">
                    <div class="client-avatar">PD</div>
                    <div>
                        <h5 class="client-name">Pooja Deshmukh</h5>
                        <span class="client-location">Nagpur</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CONVERSION SECTION -->
<section class="conversion-section">
    <div class="container conversion-grid">
        <div class="resources-block">
            <span class="section-over-title">FREE RESOURCES</span>
            <h3 class="subsection-title">Download Our Exclusive Guides</h3>
            
            <div class="resources-icons-grid" style="display:flex; flex-direction:column; gap:12px;">
                <div class="resource-item" style="display:flex; justify-content:space-between; align-items:center; padding:16px; border:1px solid rgba(0,0,0,0.05); border-radius:8px; background-color:#fff; box-shadow:0 2px 8px rgba(0,0,0,0.02);">
                    <div style="display:flex; align-items:center; gap:12px;">
                        <i class="ph ph-book-open" style="font-size:1.5rem; color:#b7412e;"></i>
                        <span style="font-weight:500; color:#333;">Interior Design Budget Planner (PDF)</span>
                    </div>
                    <!-- Assuming PDFs are uploaded to Media Library -->
                    <a href="<?php echo get_template_directory_uri(); ?>/assets/docs/HK_Interior_Designer_Budget_Guide_Fixed.pdf" download class="io-btn-download" title="Download"></a>
                </div>
            </div>
        </div>

        <div id="contact" class="form-block">
            <span class="section-over-title text-light">READY TO DESIGN?</span>
            <h3 class="subsection-title text-light">Book Your Free Consultation</h3>
            
            <form id="wa-consultation-form" class="consultation-form">
                <div class="form-row">
                    <input id="form-name" type="text" placeholder="Full Name" required>
                    <input id="form-phone" type="tel" placeholder="Phone Number" required>
                </div>
                <div class="form-row">
                    <input id="form-email" type="email" placeholder="Email Address" required>
                    <select id="form-service" required>
                        <option value="" disabled selected>Select Service</option>
                        <option value="Residential">Residential</option>
                        <option value="Commercial">Commercial</option>
                        <option value="Modular Kitchen">Modular Kitchen</option>
                    </select>
                </div>
                <textarea id="form-message" placeholder="Tell us about your project..." rows="3"></textarea>
                <button type="submit" class="btn btn-primary btn-full">Book Free Consultation &rarr;</button>
            </form>
        </div>
    </div>
</section>

<?php get_footer(); ?>
