# frozen_string_literal: true

class Spree::PostsController < Spree::StoreController
  before_action :init_pagination, only: %i[show]

  def show
    @blog = Spree::Blog.friendly.find(params[:blog_id])
    @post = @blog.posts.find(params[:id])

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  private

  def init_pagination
    @pagination_page = params[:page].present? ? params[:page].to_i : 1
    @pagination_per_page = params[:per_page].present? ? params[:per_page].to_i : 8
  end
end
