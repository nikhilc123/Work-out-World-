require 'rails_helper'
RSpec.feature "Create a sign up feature" do
  scenario do
    visit "/"
    
    click_link "Sign up"
    fill_in "First name", with: "Nikhil"
    fill_in "Last name", with: "Chikorde"
    fill_in "Email", with: "nik@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    
    expect(page).to have_content("You have signed up successfully.")
    expect(page).to have_content("Nikhil Chikorde")
  end
end