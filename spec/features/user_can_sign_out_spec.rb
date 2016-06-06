require 'rails_helper'

RSpec.feature 'User can sign out' do
  scenario 'they are redirected to the login page' do
    user = create(:user)
    login(user)

    visit links_path
    click_on 'Log Out'

    expect(current_path).to eq '/login'
    expect(page).to_not have_link 'Log Out'
    expect(page).to have_content 'Login'
  end
end
