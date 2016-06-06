require 'rails_helper'

RSpec.feature 'User views sign in sign up page' do
  scenario 'they see login and signup links' do
    visit root_path

    expect(current_path).to eq root_path
    expect(page).to have_link 'Login', href: login_path
    expect(page).to have_link 'Signup', href: new_user_path
  end
end
