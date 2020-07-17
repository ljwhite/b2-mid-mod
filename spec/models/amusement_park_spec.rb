require 'rails_helper'

Rspec.describe AmusementPark do
  describe 'relationships' do
    it {should have_many :rides}

  end
end
