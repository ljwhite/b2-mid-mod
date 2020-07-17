require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit a mechanics show page' do

    before :each do
      @amusement_park = AmusementPark.create!(name: "Six Flage", admission_price: 50.00)

      @ride_1 = Ride.create!(name: "Water Splash", thrill_rating: 8, amusement_park_id: @amusement_park.id)
      @ride_2 = Ride.create!(name: "Merry Go Round", thrill_rating: 2, amusement_park_id: @amusement_park.id)
      @ride_3 = Ride.create!(name: "Roller Coaster", thrill_rating: 10, amusement_park_id: @amusement_park.id)

      @mechanic_1 = Mechanic.create!(name: "Tim", years_experience: 5)

      MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
      MechanicRide.create!(mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)

      visit "/mechanics/#{@mechanic_1.id}"
    end

    it 'I see their name, years experience, and all rides they are working on' do

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)

    end

    it 'there is also a field to add a ride for them to work on' do

      fill_in :ride_id, with: "#{@ride_3.id}"
      click_on "Add Ride"
      visit "/mechanics/#{@mechanic_1.id}"
      expect(page).to have_content(@ride_3.name)

    end

  end
end
