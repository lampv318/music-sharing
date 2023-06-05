require 'rails_helper'

RSpec.describe 'User share a video', type: :feature do
  scenario 'User resgister success and then share a video successfull' do
    visit root_path
    click_on 'Register'
    expect(page).to have_content('Sign up')
    fill_in 'user_name', with: 'John'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: '111111'
    fill_in 'user_password_confirmation', with: '111111'
    click_on 'commit'

    expect(page).to have_content('Create Account Successfully')
    expect(page).to have_content('Share Video')

    click_on 'Share Video'
    expect(page).to have_content('Share a Youtube Video')

    fill_in 'shared_video[title]', with: 'title'
    fill_in 'shared_video[url]', with: 'https://youtu.be/AnMhdn0wJ4I?list=RDtk36ovCMsU8'
    click_on 'commit'

    expect(page).to have_content('title')
  end

  scenario 'User resgister success and then share a video failed' do
    visit root_path
    click_on 'Register'
    expect(page).to have_content('Sign up')
    fill_in 'user_name', with: 'John'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: '111111'
    fill_in 'user_password_confirmation', with: '111111'
    click_on 'commit'

    expect(page).to have_content('Create Account Successfully')
    expect(page).to have_content('Share Video')

    click_on 'Share Video'
    expect(page).to have_content('Share a Youtube Video')

    fill_in 'shared_video[title]', with: 'title'
    fill_in 'shared_video[url]', with: 'https://google.com'
    click_on 'commit'

    expect(page).to have_content('Invalid URL')
    expect(page).not_to have_content('title')
  end
end
