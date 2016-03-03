require 'rails_helper'
RSpec.feature "Creating Home Page" do
  scenario "Index page" do
    visit "/"
    
    expect(page).to have_link "Athletes Nikhil"
    expect(page).to have_link "Home"
    expect(page).to have_content("Work Out Lounge!")
  
  end
end