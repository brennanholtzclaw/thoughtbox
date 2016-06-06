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

      fill_in "Title", with: "Test Link"
      fill_in "Url", with: "http://www.example.com"
      click_button "Submit Link"

      expect(page).to have_content("THOUGHTS FOUND HERE!")
      expect(page).to have_content("Test Link")
      expect(page).to have_content("http://www.example.com")
    end
  end

  context "User enters invalid link or no title" do
    scenario "User enters invalid Link" do
      user = create(:user)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Login"

      fill_in "Title", with: "Test Link"
      fill_in "Url", with: "notalink"
      click_button "Submit Link"

      expect(page).to have_content("Url is not a valid URL")
    end

    scenario "User doesn't enter a title" do
      user = create(:user)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Login"

      fill_in "Url", with: "http://www.example.com"
      click_button "Submit Link"

      expect(page).to have_content("Title can't be blank")
    end
  end
end
