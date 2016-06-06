require 'rails_helper'

RSpec.feature 'User can submit link' do
  context 'with valid information' do
    scenario 'they see the newely created link on the links index page' do
      user = create(:user)
      login(user)
      url = 'http://petrolicious.com/'
      title = 'Petrolicious'

      fill_in 'URL', with: url
      fill_in 'Title', with: title
      click_on 'Submit'

      expect(current_path).to eq '/links'
      expect(page).to have_content('Newely submitted link!')
      expect(page).to have_link(title, href: url)
      expect(page).to have_content 'Read: false'
    end
  end

  context 'with invalid information' do
    scenario 'they see an error message' do
      user = create(:user)
      login(user)
      invalid_link = 'invalid link'
      title = 'Invalid'

      fill_in 'URL', with: invalid_link
      fill_in 'Title', with: title
      click_on 'Submit'

      expect(page).to_not have_content('Newely submitted link!')
      expect(page).to_not have_link(title, href: invalid_link)
      expect(page).to_not have_content 'Read: false'
      expect(page).to have_content 'Invalid information provided'
    end
  end
end
