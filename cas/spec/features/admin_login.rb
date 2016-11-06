require "rails_helper"

RSpec.feature "Creating Articles" do 
  scenario "A user creates a new article" do
    visit "/"
    click_button "Admin Login"
    expect(page).to have_content("Admin logged in")
    expect(page.current_path).to eq(admin_path) 
  end
end