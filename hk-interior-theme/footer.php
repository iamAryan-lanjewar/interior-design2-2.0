    </main>
</div>

<footer class="site-footer">
    <div class="container footer-grid">
        <div class="footer-col brand-col">
            <div class="logo-stack">
                <span class="logo-hk">HK</span>
                <span class="logo-sub">INTERIOR DESIGNS</span>
            </div>
            <p>Creating timeless interiors that reflect your style, enhance your lifestyle and inspire every day.</p>
        </div>
        
        <div class="footer-col links-col">
            <h4 class="footer-heading">Quick Links</h4>
            <?php 
                if ( has_nav_menu( 'footer' ) ) {
                    wp_nav_menu( array(
                        'theme_location' => 'footer',
                        'container'      => false,
                        'menu_class'     => 'footer-menu-list',
                    ) );
                } else {
                    echo '<ul><li><a href="#">Home</a></li><li><a href="#">Projects</a></li><li><a href="#">Contact</a></li></ul>';
                }
            ?>
        </div>
        
        <div class="footer-col contact-col">
            <h4 class="footer-heading">Contact Info</h4>
            <p><i class="ph ph-phone"></i> 09561377769</p>
            <p><i class="ph ph-envelope-simple"></i> info@hkinteriordesigns.com</p>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container text-center">
            <p>&copy; <?php echo date('Y'); ?> HK Interior Designs. All Rights Reserved.</p>
        </div>
    </div>
</footer>

<?php wp_footer(); ?>
</body>
</html>
