require 'rails_helper'

RSpec.describe 'New User', type: :feature do

  let(:user) { FactoryBot.create(:user) }
  let(:approved_user) { FactoryBot.create(:user, :approved) }

  scenario 'new user message' do
    visit new_user_registration_path
    fill_in 'Email', with: 'fake@fake.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('Your registration is on hold, it must be approved by an admin')
  end

  scenario 'unapproved user message' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Your account is pending approval')
  end

  scenario 'successful login' do
    visit new_user_session_path
    fill_in 'Email', with: approved_user.email
    fill_in 'Password', with: approved_user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully')
  end
end