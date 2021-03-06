require 'rails_helper'
RSpec.feature "Search Name" do
  before do
    @nik = User.create!(first_name: "Nikhil", last_name: "Chikorde", email: "nik@gmail.com", password: "password")
    @min = User.create!(first_name: "Minal", last_name: "Chikorde", email: "min@gmail.com", password: "password")
  end
  
  scenario do
    visit "/"
    fill_in "Search Name", with: "Chikorde"
    click_button "Search"
    
    expect(page).to have_content(@nik.full_name)
    expect(page).to have_content(@min.full_name)
    expect(page.current_path).to eq("/dashboard/search")
  end
end
  