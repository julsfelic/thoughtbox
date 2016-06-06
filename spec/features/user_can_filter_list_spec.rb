require 'rails_helper'

RSpec.feature 'User can filter list', js: true do
  context 'by search term' do
    xscenario 'they see only the matching links' do
      user = create(:user)
      user.links.create(url: 'www.petrolicious.com', title: 'Petrolicious')
      user.links.create(url: 'www.hodinkee', title: 'Hodinkee')
      login(user)

      fill_in '.search-box', with: 'Hodinkee'

      expect(page).to have_link 'Hodinkee'
      expect(page).to_not have_link 'Petrolicious'
    end
  end
end
