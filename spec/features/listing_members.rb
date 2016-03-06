require 'rails_helper'
RSpec.feature "Listing all members" do
  before do
    @nik = User.create!(first_name: "Nikhil", last_name: "Chikorde", email: "nik@gmail.com", password: "password")
    @min = User.create!(first_name: "Minal", last_name: "Chikorde", email: "min@gmail.com", password: "password")
  end
  
  scenario "List of all Registered Members" do
    visit "/"
    expect(page).to have_content("List of all Members")
    expect(page).to have_content(@nik.full_name)
    expect(page).to have_content(@min.full_name)
  end
end