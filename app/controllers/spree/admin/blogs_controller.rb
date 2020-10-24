class Spree::Admin::BlogsController < Spree::Admin::ResourceController

  private

  def location_after_save
    edit_admin_blog_url(@blog)
  end

  def collection
    page = params[:page].present? ? params[:page].to_i : 1
    per_page = params[:per_page].present? ? params[:per_page].to_i : 25

    model_class.page(page).per(per_page)
  end
end
