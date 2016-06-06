require "rails_helper"

RSpec.feature "User can submit new links" do
  context "User enters valid link and title" do
    scenario "User sees link displayed on page" do
      user = create(:user)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Login"

      fill_in "Title", with: "Test link"
      fill_in "Url", with: "http://www.example.com"

      expect(current_path).to eq links_path
      expect(page).to have_content("THOUGHTS FOUND HERE!")
      expect(page).to have_content("Test Link")
      expect(page).to have_content("http://www.example.com")
    end
  end
end
