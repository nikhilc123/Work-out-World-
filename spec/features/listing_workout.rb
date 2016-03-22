require 'rails_helper'
RSpec.feature "Listing exercises" do
  before do
    @nik = User.create(first_name: "Nikhil", last_name: "Chikorde", email: "nik@gmail.com", password: "password")
    @min = User.create(first_name: "Minal", last_name: "Chikorde", email: "min@gmail.com", password: "password")
    login_as(@nik)
    
    @e1 = @nik.exercises.create(duration_in_min: 20, workout: "Shoulders", workout_date: Date.today)
    @e2 = @nik.exercises.create(duration_in_min: 20, workout: "Biceps and Triceps", workout_date: Date.today)
    
    @following = Friendship.create(user: @nik, friend: @min)
  end
  
  scenario "show user exercise's for last 7 days" do
    visit "/"
    click_link "My Lounge"
    
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end
  
  scenario "Show lists of friends" do
    visit "/"
    click_link "My Lounge"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@min.full_name)
    expect(page).to have_link("Unfollow")
  end
end