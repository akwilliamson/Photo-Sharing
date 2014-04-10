require 'spec_helper'

describe User do
  context 'creating' do
    it 'signs up a user' do
      create_user_and_sign_in
      page.should have_content "Thank you for signing up!"
    end
  end
  # scenario "successfully checks profile" do
  #   create_user_and_sign_in
  #   page.should have_content "Thank you"
  #   click_link "CrabDude"
  #   page.should have_content "CrabDude"
  # end
end
