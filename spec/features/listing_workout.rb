require 'rails_helper'
RSpec.feature "Listing exercises" do
  before do
    @nik = User.create(email: "nik@gmail.com", password: "password")
    login_as(@nik)
    
    @e1 = @nik.exercises.create(duration_in_min: 20, workout: "Shoulders", workout_date: "2016-03-03")
    @e2 = @nik.exercises.create(duration_in_min: 20, workout: "Biceps and Triceps", workout_date: "2016-03-04")
  end
  
  scenario do
    visit "/"
    click_link "My Lounge"
    
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end
end