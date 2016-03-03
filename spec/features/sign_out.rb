require "rails_helper"
RSpec.feature "Signing out signed-in users" do
  before do
    @bob = User.create!(email: "bob@gmail.com", password: "password")
    @nik = User.create!(email: "nik@gmail.com", password: "password")
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: @bob.email
    fill_in "Password", with: @bob.password
    click_button "Log in"
  end
  scenario do
    visit "/"
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
  end
end