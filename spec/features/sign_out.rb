require 'rails_helper'
RSpec.feature "Signed users should sign out" do
  before do
    @bob = User.create!(email: "bob@gmail.com", password: "password")
  end
  
  scenario "A user signs out" do
    visit "/"
    
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end