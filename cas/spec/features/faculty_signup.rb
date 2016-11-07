require "rails_helper"

RSpec.feature "Faculty Signup:" do 
  scenario "Faculty signup for an account" do
    visit "/login"
    
    expect(page).to have_content("Faculty Sign Up")
    expect(page.current_path).to eq(login_path)
    
    click_button "Select your name"
    #expect(page).to have_content("Admin logged in")
    expect(page.current_path).to eq(edit_user_path) 
  end
end