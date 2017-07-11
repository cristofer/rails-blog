require "rails_helper"

RSpec.feature "Users can create new movies" do

  before do
    visit "/"
    click_link "New Post"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Post 1"
    fill_in "Body", with: "Body for Post 1"

    click_button "Create Post"

    expect(page).to have_content "Post 1"
  end
end
