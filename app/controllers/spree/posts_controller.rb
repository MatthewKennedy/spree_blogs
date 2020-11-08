# frozen_string_literal: true

class Spree::PostsController < Spree::StoreController
  def show
    @blog = Spree::Blog.by_store(current_store).friendly.find(params[:blog_id])

    fresh_when @post = @blog.posts.find(params[:id])

    @title = @post.post_seo_title

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end
end
