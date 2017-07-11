require 'rails_helper'

RSpec.feature "users can see the list of posts" do
  let!(:post) { FactoryGirl.create(:post, title: "Post 1", body: "Body Post 1") }

  scenario "anonymous users" do
    visit "/"

    expect(page).to have_content "Post 1"
  end
end
