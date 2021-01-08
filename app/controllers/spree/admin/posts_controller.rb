# frozen_string_literal: true

module Spree
  module Admin
    class PostsController < Spree::Admin::ResourceController
      def index
        @posts = collection
      end

      private

      def location_after_save
        edit_admin_post_url(@post)
      end

      def collection
        return @collection if @collection.present?

        params[:q] ||= {}
        params[:q][:s] ||= 'title asc'

        @collection = super

        # @search = Spree::Post.ransack(params[:q])
        @search = @collection.ransack(params[:q])
        @collection = @search.result.includes([:blog]).page(params[:page]).per(params[:per_page])
      end
    end
  end
end
