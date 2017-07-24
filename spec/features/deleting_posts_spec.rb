require "rails_helper"

RSpec.feature "Users can delete posts" do
  let(:admin) { FactoryGirl.create(:admin) }
  let!(:post) { FactoryGirl.create(:post, title: 'Post 1') }

  before do
    login_as(admin)
  end

  scenario "inside the movie" do
    visit "/"
    click_link "Delete"

    expect(page).to have_no_content "Post 1"
  end

  scenario "Annonymous users can not see the Delete button" do
    logout(:admin)

    visit "/"

    expect(page).to have_no_content "Delete"
  end

end
