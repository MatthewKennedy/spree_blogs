# frozen_string_literal: true

class Spree::PostsController < Spree::StoreController
  def show
    @blog = Spree::Blog.by_store(current_store).friendly.find(params[:blog_id])

    if try_spree_current_user.try(:has_spree_role?, "admin")
      @post = @blog.posts.find(params[:id])
    else
      @post = @blog.posts.visible.find(params[:id])
    end

    @title = @post.post_seo_title

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end
end
