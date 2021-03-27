# frozen_string_literal: true

class Spree::BlogsController < Spree::StoreController
  before_action :init_pagination, only: %i[show tag]

  def show
    set_blog(:id)

    @posts = @blog.posts.published_and_visible.page(@pagination_page).per(@pagination_per_page)

    @title = if @blog.meta_title.present?
      @blog.meta_title
    else
      @blog.title
    end
  end

  def tag
    set_blog(:blog_id)

    @tag = MakeTaggable::Tag.friendly.find(params[:tag])

    @posts = @blog.posts.published_and_visible.by_tag(@tag).page(@pagination_page).per(@pagination_per_page)

    @title = "#{@blog.title} | #{@tag.to_s.titlecase}"
  end

  private

  def set_blog(arg)
    @blog = Spree::Blog.by_store(current_store).friendly.find(params[arg])
  end

  def init_pagination
    @pagination_page = params[:page].present? ? params[:page].to_i : 1
    @pagination_per_page = params[:per_page].present? ? params[:per_page].to_i : 8
  end
end
