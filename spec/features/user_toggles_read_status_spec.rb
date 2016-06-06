require "rails_helper"

RSpec.feature "User can mark links as read or unread" do
  context "User marks unread idea as read, and vice-verse" do
    scenario "User sees idea as read and unread again" do
      user = create(:user_with_links)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Login"

      expect(page).to have_content("THOUGHTS FOUND HERE!")
      expect(page).to have_content("Link Title 4")
      expect(page).to have_content("http://www.example.com/4")
      expect(page).to_not have_content("Mark as Unread")

      first(:link, "Mark as Read").click
      expect(page).to have_content("Mark as Unread")

      first(:link, "Mark as Unread").click
      expect(page).to_not have_content("Mark as Unread")
    end
  end
end
