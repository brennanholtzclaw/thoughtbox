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

      expect(page).to have_content("Url is invalid")
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

  context "User should not see another user link" do
    scenario "With other links created, user only see own" do
      user1 = create(:user, email: "not@you.com", password: "password1")
      link1 = create(:link, title: "not yours", url: "http://www.mine.com")
      user1.links << link1
      user2 = create(:user)
      link2 = create(:link)
      user2.links << link2

      visit login_path
      fill_in "Email", with: user2.email
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Login"

      expect(page).to have_content(user2.links.first.title)
      expect(page).to_not have_content(user1.links.first.title)
    end
  end
end
