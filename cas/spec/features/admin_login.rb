require "rails_helper"

RSpec.feature "Admin login" do 
  scenario "Admin logs into the system" do
    visit "/"
    fill_in "ID", with: "Admin"
    fill_in "Password", with: "asdf"
    click_button "Login"
    expect(page).to have_content("Admin logged in")
    expect(page.current_path).to eq(admins_path) 
  end
end