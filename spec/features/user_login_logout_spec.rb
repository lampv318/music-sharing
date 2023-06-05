require 'rails_helper'

RSpec.describe 'User resgister', type: :feature do
  scenario 'User resgister success and then logout' do
    visit root_path
    click_on 'Register'
    expect(page).to have_content('Sign up')
    fill_in 'user_name', with: 'John'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: '111111'
    fill_in 'user_password_confirmation', with: '111111'
    click_on 'commit'

    expect(page).to have_content('Create Account Successfully')
    expect(page).to have_content('Log out')

    click_on 'Log out'
    expect(page).to have_content('Register')
  end

  scenario 'User resgister failed' do
    visit root_path
    click_on 'Register'
    expect(page).to have_content('Sign up')
    fill_in 'user_name', with: 'John'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: '111111'
    fill_in 'user_password_confirmation', with: '1111112'
    click_on 'commit'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
