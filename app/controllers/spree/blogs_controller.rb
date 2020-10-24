# frozen_string_literal: true

class Spree::BlogsController < Spree::StoreController

  before_action :init_pagination, only: %i[show]

  def show
    @blog = if try_spree_current_user.try(:has_spree_role?, 'admin')
                              Spree::Blog.friendly.find(params[:id])
                            else
                              Spree::Blog.friendly.find(params[:id])
                            end
    @posts = @blog.posts

    if @blog.meta_title.present?
      @title = @blog.meta_title
    else
      @title = @blog.title
    end
  end

  def tag
    @blog = Spree::Blog.friendly.find(params[:blog_id])

    @tag = ActsAsTaggableOn::Tag.friendly.find(params[:tag])

    @posts = @blog.posts.by_tag(@tag)
  end

  private

  def init_pagination
    @pagination_page = params[:page].present? ? params[:page].to_i : 1
    @pagination_per_page = params[:per_page].present? ? params[:per_page].to_i : 8
  end
end
