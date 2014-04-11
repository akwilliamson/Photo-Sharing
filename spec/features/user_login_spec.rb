require 'spec_helper'

describe User do
  context 'creating' do
    it 'signs up a user' do
      create_user_and_sign_in
      page.should have_content "Thank you for signing up!"
    end
  end
  context 'checks' do
    it 'checks profile' do
      create_user_and_sign_in
      page.should have_content "Thank you"
      click_link @name
      page.should have_content @name
    end
  end
  context 'add photo' do
    it "adds a photo" do
      create_user_and_sign_in
      add_photo
      page.should have_xpath("//img[@alt='Opposum']")
    end
  end
  context 'favorite' do
    it "allows user to click image link and go to image show page" do
      create_user_and_sign_in
      add_photo
      click_link "Home"
      find(:xpath, "//a/img[@alt='Opposum']/..").click
      page.should have_content "Add a tag"
    end
    it "allows user to favorite a photo" do
      create_user_and_sign_in
      add_photo
      click_link "Home"
      find(:xpath, "//a/img[@alt='Opposum']/..").click
      click_button "yellow"
      page.should have_content "Favorited!"
    end
  end
end
