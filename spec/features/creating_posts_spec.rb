require "rails_helper"

RSpec.feature "Logged users can create new posts" do

  let(:admin) { FactoryGirl.create(:admin) }
  let!(:tag) { FactoryGirl.create(:tag, name: 'Tag Created') }

  before do
    login_as(admin)
    visit "/"
    click_link "New Post"
  end

  scenario "with valid attributes" do
    expect(page).to have_content "Tag Created"

    fill_in "Title", with: "Post 1"
    fill_in "Body", with: "Body for Post 1"
    fill_in "Tag list", with: "Tag 1"

    click_button "Create Post"

    expect(page).to have_content "Post 1"
    expect(page).to have_content "Tag 1"
  end
end
