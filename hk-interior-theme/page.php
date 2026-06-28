<?php
/**
 * The template for displaying all static pages
 */
get_header(); ?>

<?php while ( have_posts() ) : the_post(); ?>

    <section class="generic-page-header" style="padding: 120px 0 60px; background-color: #f7f6f2; text-align: center;">
        <div class="container">
            <h1 class="primary-heading-new"><?php the_title(); ?></h1>
            <div class="title-divider" style="margin: 20px auto;"></div>
        </div>
    </section>

    <section class="content-area" style="padding: 60px 0;">
        <div class="container" style="max-width: 900px; margin: 0 auto; line-height: 1.8;">
            <?php the_content(); ?>
        </div>
    </section>

<?php endwhile; ?>

<?php get_footer(); ?>
