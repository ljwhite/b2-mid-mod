require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a parks show page' do
    before :each do
      @amusement_park = AmusementPark.create!(name: "Six Flage", admission_price: 50.00)
      @ride_1 = Ride.create!(name: "Water Splash", thrill_rating: 8, amusement_park_id: @amusement_park.id)
      @ride_2 = Ride.create!(name: "Merry Go Round", thrill_rating: 2, amusement_park_id: @amusement_park.id)

      visit "/parks/#{@amusement_park.id}"
    end


    it 'I see the name and price of admission to that park' do

      expect(page).to have_content(@amusement_park.name)
      expect(page).to have_content(@amusement_park.admission_price)
    end

    it 'I see the names of all rides at that park in alphabetical order' do

      expect(page).to have_content(@ride_2.name)
      expect(page).to have_content(@ride_1.name)

    end

    it 'I see the average thrill rating of the rides ' do
       expect(page).to have_content("Average Thrill Rating of Rides: 5.0/10")
    end

  end
end
