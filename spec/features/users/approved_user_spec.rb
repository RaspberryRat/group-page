require 'rails_helper'

RSpec.describe 'Approved user', type: :feature, js: true do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }

  scenario 'destroy approved user' do
    sign_in admin_user
    user = FactoryBot.create(:user, :approved)
    visit users_path
    within('.approved-users') do
      expect(page).to have_content(user.email)
    end
    within("tr#user_#{user.id}") do
      click_on 'Delete User'
      accept_alert
    end
    within('.approved-users') do
      expect(page).to have_content(user.email)
    end
  end

  scenario 'non-admin to admin user' do
    sign_in admin_user
    user = FactoryBot.create(:user, :approved)
    visit users_path
    expect(user.admin?).to be(false)
    within("tr#user_#{user.id}") do
      expect(page).to have_unchecked_field('user_admin')
      check('user_admin')
      expect(page).to have_checked_field('user_admin')
    end
    user.reload
    expect(user.admin?).to be(true)
  end

  scenario 'non-poster to poster user' do
    sign_in admin_user
    user = FactoryBot.create(:user, :approved)
    visit users_path
    expect(user.poster?).to be(false)
    within("tr#user_#{user.id}") do
      expect(page).to have_unchecked_field('user_poster')
      check('user_poster')
      expect(page).to have_checked_field('user_poster')
    end
    user.reload
    expect(user.poster?).to be(true)
  end

  scenario 'non-organizer to organizer user' do
    sign_in admin_user
    user = FactoryBot.create(:user, :approved)
    visit users_path
    expect(user.organizer?).to be(false)
    within("tr#user_#{user.id}") do
      expect(page).to have_unchecked_field('user_organizer')
      check('user_organizer')
      expect(page).to have_checked_field('user_organizer')
    end
    user.reload
    expect(user.organizer?).to be(true)
  end

  scenario 'admin to non-admin user' do
    sign_in admin_user
    user = FactoryBot.create(:user, :approved, :admin_account)
    visit users_path
    expect(user.admin?).to be(true)
    within("tr#user_#{user.id}") do
      expect(page).to have_checked_field('user_admin')
      uncheck('user_admin')
      expect(page).to have_unchecked_field('user_admin')
    end
    user.reload
    expect(user.admin?).to be(false)
  end

  scenario 'poster to non-poster user' do
    sign_in admin_user
    user = FactoryBot.create(:user, :approved, :can_post)
    visit users_path
    expect(user.poster?).to be(true)
    within("tr#user_#{user.id}") do
      expect(page).to have_checked_field('user_poster')
      uncheck('user_poster')
      expect(page).to have_unchecked_field('user_poster')
    end
    user.reload
    expect(user.poster?).to be(false)
  end

  scenario 'organizer to non-organizer user' do
    sign_in admin_user
    user = FactoryBot.create(:user, :approved, :event_organizer)
    visit users_path
    expect(user.organizer?).to be(true)
    within("tr#user_#{user.id}") do
      expect(page).to have_checked_field('user_organizer')
      uncheck('user_organizer')
      expect(page).to have_unchecked_field('user_organizer')
    end
    user.reload
    expect(user.organizer?).to be(false)
  end
end