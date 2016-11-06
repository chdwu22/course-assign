require "rails_helper"

RSpec.feature "Manage Users" do 
  scenario "Admin adds a user" do
    visit "/admins"
    click_link "Add Faculty"
    
    expect(page).to have_content("Add Faculty")
    
    fill_in "First Name", with: "Nancy"
    fill_in "Last Name", with: "Amato"
    click_button "Add"
    
    expect(page).to have_content("Successfully Added")
    expect(page.current_path).to eq(users_path)
  end
end