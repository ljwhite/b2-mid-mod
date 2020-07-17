require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit the mechanics index page' do
    it 'shows me a list of all mechanics, including name and years of experience' do

      mechanic_1 = Mechanic.create!(name: "Tim", years_experience: 5)
      mechanic_2 = Mechanic.create!(name: "Bob", years_experience: 10)

      visit 'mechanics'
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.years_experience)
      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content(mechanic_2.years_experience)

    end
  end
end
