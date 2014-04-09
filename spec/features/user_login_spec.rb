require 'spec_helper'

feature "user logs in" do
  scenario "successfully signs up for the site" do
    visit root_path
    click_link "Sign Up"
    fill_in "Email", with: "capybara@capybara.com"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Sign Up"
    page.should have_content "Thank you"
  end

  scenario "successfully logs in" do
    visit root_path
    click_link "Sign Up"
    fill_in "Email", with: "capybara@capybara.com"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Sign Up"
    page.should have_content "Thank you"
    click_link "Log In"
    fill_in "Email", with: "capybara@capybara.com"
    fill_in "Password", with: "12345"
    click_button "Log In"
    page.should have_content "capybara@capybara.com"
  end
end
