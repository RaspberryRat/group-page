require 'rails_helper'

RSpec.describe 'Pending user', type: :feature, js: true do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }

  scenario 'show pending user' do
    sign_in admin_user
    user = FactoryBot.create(:user)
    visit users_path
    click_on 'Show Pending Users'
    within('.pending-users') do
      expect(page).to have_content(user.email)
    end
    within('.approved-users') do
      expect(page).to_not have_content(user.email)
    end
  end

  scenario 'approve pending user' do
    sign_in admin_user
    user = FactoryBot.create(:user)
    visit users_path
    click_on 'Show Pending Users'
    within('.pending-users') do
      expect(page).to have_content(user.email)
    end
    click_on 'Approve User'
    within('.pending-users') do
      expect(page).to_not have_content(user.email)
    end
    within('.approved-users') do
      expect(page).to have_content(user.email)
    end
  end

  scenario 'reject pending user' do
    sign_in admin_user
    user = FactoryBot.create(:user)
    visit users_path
    click_on 'Show Pending Users'
    within('.pending-users') do
      expect(page).to have_content(user.email)
    end
    click_on 'Reject User'
    accept_alert
    within('.pending-users') do
      expect(page).to_not have_content(user.email)
    end
    within('.approved-users') do
      expect(page).to_not have_content(user.email)
    end
  end
end