require 'rails_helper'

RSpec.feature 'User can edit link' do
  context 'with valid info' do
    scenario 'they see the edited link' do
      user = create(:user)
      user.links.create(url: 'www.petrolicious.com', title: 'Petrolicious')
      user.links.create(url: 'www.hodinkee', title: 'Hodinkee')
      new_url = 'www.theverge.com'
      new_title = 'The Verge'
      login(user)

      links = find('.links').all('li')
      links.each do |link|
        expect(link).to have_link('Edit')
      end

      within(links.first) do
        click_on 'Edit'
      end

      fill_in 'Url', with: new_url
      fill_in 'Title', with: new_title
      click_on 'Edit'

      expect(current_path).to eq '/links'
      expect(page).to have_content('Link updated!')
      expect(page).to have_link new_title, href: new_url
    end
  end

  context 'with invalid info' do
    scenario 'they see an error message' do
      user = create(:user)
      user.links.create(url: 'www.petrolicious.com', title: 'Petrolicious')
      user.links.create(url: 'www.hodinkee', title: 'Hodinkee')
      invalid_url = ''
      new_title = 'The Verge'
      login(user)

      links = find('.links').all('li')
      links.each do |link|
        expect(link).to have_link('Edit')
      end

      within(links.first) do
        click_on 'Edit'
      end

      fill_in 'Url', with: invalid_url
      fill_in 'Title', with: new_title
      click_on 'Edit'

      expect(page).to_not eq '/links'
      expect(page).to have_content 'Invalid parameters'
    end
  end
end
