require "rails_helper"

RSpec.feature "visitor logs in" do
  context "enters valid username and password combination" do
    scenario "sees thoughts page" do
      user = create(:user)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Login"

      expect(current_path).to eq links_path
      expect(page).to have_content("THOUGHTS FOUND HERE!")
    end
  end

  context "creates new account" do
    scenario "signs up new account" do
      visit new_user_path

      fill_in "Email", with: "test@testemail.com"
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Sign Up"

      expect(User.first.email).to eq ("test@testemail.com")
      expect(current_path).to eq links_path
      expect(page).to have_content("THOUGHTS FOUND HERE!")
    end
  end

  context "signs out" do
    scenario "user sees root welcome page" do
      visit new_user_path

      fill_in "Email", with: "test@testemail.com"
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Sign Up"

      click_link "Log Out"

      expect(current_path).to eq welcome_path
      expect(page).to have_content("WELCOME!")
    end
  end

end
