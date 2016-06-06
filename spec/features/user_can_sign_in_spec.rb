require 'rails_helper'

RSpec.feature 'User can sign in' do
  context 'with valid info' do
    scenario 'they are sent to the links page' do
      user = create(:user)

      visit root_path
      click_on 'Login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Login'

      expect(current_path).to eq '/links'
      expect(page).to have_content 'All of the links!'
      expect(page).to have_content "Welcome, #{user.email}!"
      expect(page).to have_link 'Log Out', href: '/logout'
    end
  end

  context 'with invalid info' do
    scenario 'they see an error' do
      user = create(:user)

      visit root_path
      click_on 'Login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: ''
      click_on 'Login'

      expect(current_path).to_not eq '/links'
      expect(page).to have_content('Invalid email / password combination')
    end
  end
end
