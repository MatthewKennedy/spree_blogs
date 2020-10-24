# frozen_string_literal: true

class Spree::PostsController < Spree::StoreController
  helper 'spree/posts'

  before_action :init_pagination, only: %i[show tag archive author]
  
  def show
   @blog = Spree::Blog.friendly.find(params[:blog_id])
   @post = @blog.posts.find(params[:id])

   respond_to do |format|
     format.html
     format.rss { render layout: false }
   end
  end

  def tag
    @posts = Spree::Post.visible.by_tag(params[:tag])
                                 .page(@pagination_page)
                                 .per(@pagination_per_page)

    @tag_name = params[:tag]
  end

  def archive
    @posts = Spree::Post.visible.by_date(params)
                                 .page(@pagination_page)
                                 .per(@pagination_per_page)
  end

  def author
    @author = Spree.user_class.where(nickname: params[:author]).first
    @posts = Spree::Post.visible.by_author(@author)
                                 .page(@pagination_page)
                                 .per(@pagination_per_page)
  end

  private

  def init_pagination
    @pagination_page = params[:page].present? ? params[:page].to_i : 1
    @pagination_per_page = params[:per_page].present? ? params[:per_page].to_i : 8
  end
end
