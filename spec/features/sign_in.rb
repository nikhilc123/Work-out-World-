require 'rails_helper'
RSpec.feature "User should sign in with valid credentials" do
  before do
    @bob = User.create!(email: "bob@gmail.com", password: "password")
  end
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign In"
    
    fill_in "Email", with: @bob.email
    fill_in "Password", with: @bob.password
    click_button "Log in"
    
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as: #{@bob.email}")
  end
end