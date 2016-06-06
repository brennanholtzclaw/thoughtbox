require "rails_helper"

RSpec.feature "visitor logs in" do
  context "enters valid username and password combination" do
    scenario "sees user dashboard page" do
      user = create(:user)
      visit "/"
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
      click_button "Login"

      expect(current_path).to eq thoughts_path
      expect(page).to have_content("THOUGHTS FOUND HERE!")
    end
  end
end
