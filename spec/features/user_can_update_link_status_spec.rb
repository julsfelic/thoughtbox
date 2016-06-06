require 'rails_helper'

RSpec.feature 'User can update link status', js: true do
  context 'when clicking on Mark as Read' do
    xscenario 'then the link is styled with a strike through for read' do
      user = create(:user)
      user.links.create(url: 'www.petrolicious.com', title: 'Petrolicious')
      user.links.create(url: 'www.hodinkee', title: 'Hodinkee')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # login(user)

      visit links_path
      links = find('.links').all('li')
      links.each do |link|
        expect(link).to have_link('Mark as Read')
      end

      within(links.first) do
        click_on 'Mark as Read'
      end

      expect(current_path).to eq '/links'
      expect(page).to have_content 'Read: true'
    end
  end
end
