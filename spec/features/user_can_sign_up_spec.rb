require 'rails_helper'

RSpec.feature 'User can sign up' do
  context 'with valid information' do
    scenario 'they are signed in and redirected to the Links page' do
      email = 'julsfelic@example.com'
      password = 'password'

      visit root_path
      click_on 'Signup'

      expect(current_path).to eq '/signup'

      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_on 'Sign up'

      expect(current_path).to eq '/links'
      expect(page).to have_content 'All of the links!'
      expect(page).to have_content 'Thank your for signing up!'
      expect(page).to have_content "Welcome, #{email}!"
      expect(page).to have_link 'Log Out', href: '/logout'
    end
  end

  context 'with invalid information' do
    scenario 'they see an error message' do
      email = 'julsfelic@example.com'
      invalid_password = ''

      visit root_path
      click_on 'Signup'

      expect(current_path).to eq '/signup'

      fill_in 'Email', with: email
      fill_in 'Password', with: invalid_password
      fill_in 'Password confirmation', with: invalid_password
      click_on 'Sign up'

      expect(current_path).to_not eq '/links'
      expect(page).to have_content 'There are 3 errors'
    end
  end

  # context 'with an email that is already taken' do
  #
  # end
end
