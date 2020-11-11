# frozen_string_literal: true

require "spec_helper"

describe Spree::Blog, type: :model do
  let!(:blog) { create(:blog) }

  describe ".title" do
    it "returns the title" do
      expect(blog.title).to eq "News"
    end
  end
end
