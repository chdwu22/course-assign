require "rails_helper"

RSpec.feature "Manage Users:" do 
  scenario "Admin adds a user" do
    visit "/admins"
    click_link "Add Faculty"
    
    expect(page).to have_content("Add Faculty")
    
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    click_button "Create User"
    
    expect(page).to have_content("John Doe was successfully added")
    expect(page.current_path).to eq(users_path)
  end
  
  scenario "List Faculty" do
    visit "/admins"
    click_link "Faculty List"
    
    expect(page).to have_content("Faculty List")
    
    expect(page.current_path).to eq(users_path)
  end
  
  scenario "Admin fails to add faculty" do 
    visit "/admins"
    click_link "Add Faculty"
    
    expect(page).to have_content("Add Faculty")
    
    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    click_button "Create User"
    
    expect(page).to have_content("error") 
    expect(page).to have_content("First name can't be blank") 
    expect(page).to have_content("Last name can't be blank")
  end
end