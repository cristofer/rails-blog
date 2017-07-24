require 'rails_helper'

RSpec.feature "Users can view posts" do
  let(:admin) { FactoryGirl.create(:admin) }
  let!(:post) { FactoryGirl.create(:post, title: "Post 1") }

  shared_examples "show post" do

    it "expect correct content" do
      visit "/"
      click_link "READ MORE"

      expect(page).to have_content("tag 1")
      expect(page).to have_content("Post 1")
    end

  end

  before do
    login_as(admin)

    post.tag_list = "tag 1"
    post.save
  end

  context "Admin logged in" do
    it_behaves_like "show post"
  end

  context "Annonymous users" do
    before do
      logout(:admin)
    end

    it_behaves_like "show post"
  end
end
