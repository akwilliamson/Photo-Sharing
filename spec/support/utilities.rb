def create_user_and_sign_in
  user = FactoryGirl.create :user
  visit root_path
  click_link "Sign Up"
  @name = user.name
  fill_in "Name", with: user.name
  fill_in "Email", with: Faker::Internet.email
  fill_in "Password", with: user.password
  fill_in "Password confirmation", with: user.password
  click_button "Sign Up"
end

def add_photo
  click_link @name
  attach_file("Add photo", File.expand_path("./app/assets/images/opposum.jpeg"))
  click_button "Submit"
end
