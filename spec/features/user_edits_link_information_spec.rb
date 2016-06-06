require "rails_helper"

RSpec.feature "User can edit links" do
  context "User clicks edit link" do
    scenario "User sees changes made to links" do
      user = create(:user_with_links)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Login"

      expect(page).to have_content("THOUGHTS FOUND HERE!")
      expect(page).to have_content("Link Title 1")
      expect(page).to have_content("http://www.example.com/1")
      expect(page).to_not have_content("Mark as Unread")

      first(:link, "Edit this link").click

      fill_in "Title", with: "new title"
      fill_in "Url", with: "http://www.example.com/new_url"
      click_button "Edit Link"

      expect(page).to have_content("THOUGHTS FOUND HERE!")
      expect(page).to have_content("new title")
      expect(page).to have_content("http://www.example.com/new_url")
      expect(page).to_not have_content("Link Title 1")
      expect(page).to_not have_content("http://www.example.com/1")
    end
  end
end
