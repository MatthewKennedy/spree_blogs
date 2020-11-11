# frozen_string_literal: true

require "spec_helper"

describe Spree::Post, type: :model do
  let!(:post) { create(:post) }

  describe ".title" do
    it "returns the title" do
      expect(post.title).to eq "First Post"
    end
  end
end
