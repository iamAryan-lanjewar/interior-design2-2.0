<?php
/**
 * HK Interior Designs functions and definitions
 */

if ( ! function_exists( 'hk_interior_setup' ) ) :
    function hk_interior_setup() {
        add_theme_support( 'automatic-feed-links' );
        add_theme_support( 'title-tag' );
        add_theme_support( 'post-thumbnails' );

        register_nav_menus( array(
            'primary' => esc_html__( 'Primary Menu', 'hk-interior' ),
            'footer'  => esc_html__( 'Footer Menu', 'hk-interior' ),
        ) );

        add_theme_support( 'html5', array(
            'search-form',
            'comment-form',
            'comment-list',
            'gallery',
            'caption',
            'style',
            'script',
        ) );
    }
endif;
add_action( 'after_setup_theme', 'hk_interior_setup' );

function hk_interior_scripts() {
    wp_enqueue_style( 'hk-interior-fonts', 'https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400&display=swap', array(), null );
    wp_enqueue_style( 'hk-interior-style', get_template_directory_uri() . '/assets/css/style.css', array(), '1.0.0' );
    wp_enqueue_style( 'hk-interior-theme-style', get_stylesheet_uri(), array(), '1.0.0' );
    wp_enqueue_script( 'phosphor-icons', 'https://unpkg.com/@phosphor-icons/web', array(), null, false );
    wp_enqueue_script( 'hk-interior-script', get_template_directory_uri() . '/assets/js/script.js', array(), '1.0.0', true );
}
add_action( 'wp_enqueue_scripts', 'hk_interior_scripts' );
