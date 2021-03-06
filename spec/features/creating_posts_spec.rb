require "rails_helper"

RSpec.feature "Users can create new posts" do

  let(:admin) { FactoryGirl.create(:admin) }
  let!(:tag) { FactoryGirl.create(:tag, name: 'Tag Created') }

  before do
    login_as(admin)
    visit "/"
    click_link "New Post"
  end

  scenario "Logged: with valid attributes" do
    expect(page).to have_content "Tag Created"

    fill_in "Title", with: "Post 1"
    fill_in "Body", with: "Body for Post 1"
    fill_in "Tag list", with: "Tag 1"

    click_button "Create Post"

    expect(page).to have_content "Post 1"
    expect(page).to have_content "Tag 1"
  end

  scenario "Logged: with invalid attributes" do
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    fill_in "Tag list", with: "Tag 1"

    click_button "Create Post"

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Body can't be blank"
    expect(page).to_not have_content "Tag 1"
  end

  scenario "Annonymous users can not create posts" do
    logout(:admin)
    visit "/posts/new"

    expect(page).to have_content "Log in"
  end
end
