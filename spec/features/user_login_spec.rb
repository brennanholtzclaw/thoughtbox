require "rails_helper"

RSpec.feature "visitor logs in" do
  context "enters valid username and password combination" do
    scenario "sees user dashboard page" do
      user = create(:user)
      visit "/"
      fill_in "Username", with: user.email
      fill_in "Password", with: "password"
      click_button "Login"

      expect(current_path).to eq "/dashboard"
      expect(page).to have_content("Logged in as #{user.username}")
      expect(page).to have_content("All Orders")
      expect(page).to have_content("Logout")
      expect(page).to have_content("My Account")
      expect(page).to_not have_content("Login")
      expect(page).to_not have_content("Create Account")
    end
  end
end
