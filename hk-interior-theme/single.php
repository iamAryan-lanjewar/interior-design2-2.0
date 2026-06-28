<?php
/**
 * The template for displaying all single posts and attachments
 */
get_header(); ?>

<?php while ( have_posts() ) : the_post(); ?>

    <section class="single-post-header" style="padding: 120px 0 60px; background-color: #f7f6f2; text-align: center;">
        <div class="container">
            <h1 class="primary-heading-new"><?php the_title(); ?></h1>
            <p class="post-meta" style="color: #666; margin-top: 15px;">
                <?php echo get_the_date(); ?> | By <?php the_author(); ?>
            </p>
        </div>
    </section>

    <section class="content-area" style="padding: 60px 0;">
        <div class="container" style="max-width: 900px; margin: 0 auto; line-height: 1.8;">
            
            <?php if ( has_post_thumbnail() ) : ?>
                <div class="featured-image" style="margin-bottom: 40px; border-radius: 12px; overflow: hidden;">
                    <?php the_post_thumbnail('full', array('style' => 'width:100%; height:auto; display:block;')); ?>
                </div>
            <?php endif; ?>

            <div class="post-content">
                <?php the_content(); ?>
            </div>

            <div class="post-navigation" style="margin-top: 60px; display: flex; justify-content: space-between; border-top: 1px solid #eee; padding-top: 20px;">
                <div class="nav-previous"><?php previous_post_link( '%link', '&larr; %title' ); ?></div>
                <div class="nav-next"><?php next_post_link( '%link', '%title &rarr;' ); ?></div>
            </div>

        </div>
    </section>

<?php endwhile; ?>

<?php get_footer(); ?>
