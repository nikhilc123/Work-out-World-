require 'rails_helper' do
  RSpec.feature "Follow friends" do
    @nik = User.create!(first_name: "Nikhil", last_name: "Chikorde", email: "nik@gmail.com", password: "password")
    @jul = User.create!(first_name: "Juliette", last_name: "Mount", email: "juliette@gmail.com", password: "password")
    
    login_as(@nik)
  end
  
  scenario "if sign in succeds" do
    visit "/"
    
    expect(page).to have_content(@nik.full_name)
    expect(page).to have_content(@jul.full_name)
    #should not follow nik because have logged in as nik, instead should follow others users
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@nik.id}")
  
    #follow other friends
    link= "a[href='/friendships?friend_id=#{@jul.id}']"
    find(link).click
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@jul.id}")
  end
end