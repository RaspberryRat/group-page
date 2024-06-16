require 'rails_helper'

RSpec.describe 'Destroying an event', type: :feature, js: true do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }
  let(:non_admin_user) { FactoryBot.create(:user, :approved) }
  let(:organizer_user) { FactoryBot.create(:user, :approved, :event_organizer) }

  scenario 'valid inputs' do
    sign_in admin_user
    event = FactoryBot.create(:event)
    visit events_path
    expect(page).to have_content(event.name)
    visit event_path(event)
    click_on 'Delete Event'
    accept_alert
    visit events_path
    expect(page).to_not have_content(event.name)
  end

  scenario 'invalid user is forbidden' do
    sign_in non_admin_user
    event = FactoryBot.create(:event)
    visit event_path(event)
    expect(page).to_not have_content("Delete Event")
  end

  scenario 'valid inputs for event organizer user' do
    sign_in organizer_user
    event = FactoryBot.create(:event)
    visit events_path
    expect(page).to have_content(event.name)
    visit event_path(event)
    click_on 'Delete Event'
    accept_alert
    visit events_path
    expect(page).to_not have_content(event.name)
  end
end