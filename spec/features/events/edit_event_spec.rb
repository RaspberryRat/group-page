require 'rails_helper'

RSpec.describe 'Editing a post', type: :feature do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }
  let(:non_admin_user) { FactoryBot.create(:user, :approved) }
  let(:organizer_user) { FactoryBot.create(:user, :approved, :event_organizer) }
  let(:event) { FactoryBot.create(:event) }

  scenario 'valid inputs event name' do
    sign_in admin_user
    visit event_path(event)
    click_on 'Edit Event'
    fill_in 'Event Name', with: 'Edited Title'
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content('Edited Title')
  end

  scenario 'valid inputs event location' do
    sign_in admin_user
    visit event_path(event)
    click_on 'Edit Event'
    fill_in 'Location', with: 'New Location'
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content('New Location')
  end

  scenario 'valid inputs event date' do
    sign_in admin_user
    visit event_path(event)
    click_on 'Edit Event'
    fill_in 'Event Date', with: Date.tomorrow
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content(Date.tomorrow.strftime("%A, %B %d, %Y"))
  end

  scenario 'invalid inputs name' do
    sign_in admin_user
    visit event_path(event)
    click_on 'Edit Event'
    fill_in 'Event Name', with: ''
    click_on 'Update Event'
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'invalid inputs name too short' do
    sign_in admin_user
    visit event_path(event)
    click_on 'Edit Event'
    fill_in 'Event Name', with: '1234'
    click_on 'Update Event'
    expect(page).to have_content("Name is too short (minimum is 5 characters)")
  end

  scenario 'invalid user is forbidden' do
    sign_in non_admin_user
    visit edit_event_path(event)
    expect(page.status_code).to eq(403)
  end

  scenario 'valid inputs for event organizer user' do
    sign_in organizer_user
    visit event_path(event)
    click_on 'Edit Event'
    fill_in 'Event Name', with: 'Edited Title'
    click_on 'Update Event'
    visit events_path
    expect(page).to have_content('Edited Title')
  end
end