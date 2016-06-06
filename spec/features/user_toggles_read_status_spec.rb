require "rails_helper"

RSpec.feature "User can mark links as read or unread" do
  context "User marks unread idea as read" do
    scenario "User sees idea as read" do
      user = create(:user_with_links)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Login"

      expect(page).to have_content("THOUGHTS FOUND HERE!")
      expect(page).to have_content("Link Title 4")
      expect(page).to have_content("http://www.example.com/4")

      
    end
  end
end
