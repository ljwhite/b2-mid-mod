require 'rails_helper'

RSpec.describe AmusementPark do

  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'methods' do
    it '#average_thrill_rating' do
      amusement_park = AmusementPark.create!(name: "Six Flage", admission_price: 50.00)
      ride_1 = Ride.create!(name: "Water Splash", thrill_rating: 8, amusement_park_id: amusement_park.id)
      ride_2 = Ride.create!(name: "Merry Go Round", thrill_rating: 2, amusement_park_id: amusement_park.id)

      expect(amusement_park.average_thrill_rating).to eq(5.0)
    end
  end
end
