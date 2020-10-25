# frozen_string_literal: true

class Spree::PostsController < Spree::StoreController
  def show
    @blog = Spree::Blog.friendly.find(params[:blog_id])
    @post = @blog.posts.find(params[:id])

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end
end
