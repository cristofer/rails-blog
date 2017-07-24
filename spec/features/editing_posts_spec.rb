require 'rails_helper'

RSpec.feature "Users can edit existing posts" do
  let(:admin) { FactoryGirl.create(:admin) }
  let!(:post) { FactoryGirl.create(:post, title: 'Post 1') }

  before do
    login_as(admin)

    visit "/"
    click_link "Edit"
  end

  scenario "Logged: with valid attributes" do
    fill_in "Title", with: "Post 1"
    fill_in "Body", with: "Body for Post 1"
    fill_in "Tag list", with: "Tag 1"

    click_button "Update Post"

    expect(page).to have_content "Post 1"
    expect(page).to have_content "Body for Post 1"
    expect(page).to have_content "Tag 1"
  end

  scenario "Logged: with invalid attributes" do
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    fill_in "Tag list", with: "Tag 1"

    click_button "Update Post"

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Body can't be blank"
    expect(page).to_not have_content "Tag 1"
  end

  scenario "Annonymous users can not update posts" do
    logout(:admin)
    visit "/posts/#{post.id}/edit"

    expect(page).to have_content "Log in"
  end
end
