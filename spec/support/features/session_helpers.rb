module Features
  module SessionHelpers
    def login(user)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password'
      click_on 'Login'
    end
  end
end
