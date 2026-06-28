<?php
/**
 * The template for displaying archive pages
 */
get_header(); ?>

<section class="generic-page-header" style="padding: 120px 0 60px; background-color: #f7f6f2; text-align: center;">
    <div class="container">
        <h1 class="primary-heading-new">
            <?php 
                if ( is_category() ) {
                    single_cat_title();
                } elseif ( is_tag() ) {
                    single_tag_title();
                } elseif ( is_author() ) {
                    the_author();
                } else {
                    echo 'Archives';
                }
            ?>
        </h1>
        <div class="title-divider" style="margin: 20px auto;"></div>
        <div class="archive-description" style="color: #666; margin-top: 15px;">
            <?php the_archive_description(); ?>
        </div>
    </div>
</section>

<section class="content-area" style="padding: 60px 0;">
    <div class="container">
        <?php if ( have_posts() ) : ?>
            <div class="projects-grid">
                <?php while ( have_posts() ) : the_post(); ?>
                    <article id="post-<?php the_ID(); ?>" <?php post_class('project-card'); ?>>
                        <?php if ( has_post_thumbnail() ) : ?>
                            <div class="project-img-wrapper">
                                <a href="<?php the_permalink(); ?>">
                                    <?php the_post_thumbnail('large', array('class' => 'project-img')); ?>
                                </a>
                            </div>
                        <?php endif; ?>
                        
                        <div class="project-info" style="padding: 24px;">
                            <h3 class="project-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
                            <div class="project-desc">
                                <?php the_excerpt(); ?>
                            </div>
                            <a href="<?php the_permalink(); ?>" class="project-link">Read More &rarr;</a>
                        </div>
                    </article>
                <?php endwhile; ?>
            </div>
            
            <div class="pagination">
                <?php the_posts_pagination(); ?>
            </div>

        <?php else : ?>
            <p><?php esc_html_e( 'Sorry, no posts were found in this archive.', 'hk-interior' ); ?></p>
        <?php endif; ?>
    </div>
</section>

<?php get_footer(); ?>
