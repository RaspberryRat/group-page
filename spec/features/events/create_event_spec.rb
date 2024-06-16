require 'rails_helper'

RSpec.describe 'Creating a post', type: :feature do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }
  let(:non_admin_user) { FactoryBot.create(:user, :approved) }
  let(:organizer_user) { FactoryBot.create(:user, :approved, :event_organizer) }

  scenario 'valid inputs' do
    sign_in admin_user
    visit new_event_path
    fill_in 'Event Name', with: 'Fake Event'
    fill_in 'Event Date', with: Date.tomorrow
    fill_in 'Location', with: 'Fake Location'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Fake Event')
    expect(page).to have_content(Date.tomorrow.strftime("%A, %B %d, %Y"))
    expect(page).to have_content('Fake Location')
  end

  scenario 'invalid inputs name' do
    sign_in admin_user
    visit new_event_path
    fill_in 'Event Name', with: ''
    click_on 'Create Event'
    expect(page).to have_content("Name can't be blank")
  end
  scenario 'invalid inputs name too short' do
    sign_in admin_user
    visit new_event_path
    fill_in 'Event Name', with: '1234'
    click_on 'Create Event'
    expect(page).to have_content("Name is too short (minimum is 5 characters)")
  end


  scenario 'invalid inputs date' do
    sign_in admin_user
    visit new_event_path
    fill_in 'Event Date', with: ''
    click_on 'Create Event'
    expect(page).to have_content("Date can't be blank")
  end

  scenario 'invalid inputs location' do
    sign_in admin_user
    visit new_event_path
    fill_in 'Location', with: ''
    click_on 'Create Event'
    expect(page).to have_content("Location can't be blank")
  end

  scenario 'invalid inputs location too short' do
    sign_in admin_user
    visit new_event_path
    fill_in 'Location', with: ''
    click_on 'Create Event'
    expect(page).to have_content("Location is too short (minimum is 5 characters)")
  end

  scenario 'invalid user is forbidden' do
    sign_in non_admin_user
    visit new_event_path
    expect(page.status_code).to eq(403)
  end

  scenario 'valid inputs for event organizer user' do
    sign_in organizer_user
    visit new_event_path
    fill_in 'Event Name', with: 'Third Event'
    fill_in 'Event Date', with: Date.tomorrow
    fill_in 'Location', with: 'Third Location'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Third Event')
    expect(page).to have_content(Date.tomorrow.strftime("%A, %B %d, %Y"))
    expect(page).to have_content('Third Location')
  end
end