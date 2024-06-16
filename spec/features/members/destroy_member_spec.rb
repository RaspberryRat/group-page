require 'rails_helper'

RSpec.describe 'Edit Member', type: :feature, js: true do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }
  let(:non_admin_user) { FactoryBot.create(:user, :approved) }

  scenario 'valid inputs' do
    sign_in admin_user
    member = FactoryBot.create(:member)
    visit members_path
    expect(page).to have_content(member.full_name)
    click_on 'Delete Member'
    accept_alert
    expect(page).to have_content("#{member.full_name} was successfully deleted.")
    visit members_path
    expect(page).to_not have_content(member.full_name)
  end

  scenario 'non-admin cannot delete' do
    sign_in non_admin_user
    member = FactoryBot.create(:member, :steward_member)
    visit members_path
    expect(page).to have_content(member.full_name)
    expect(page).to_not have_content('Delete Member')
  end

  scenario 'not logged in cannot delete' do
    member = FactoryBot.create(:member, :steward_member)
    visit members_path
    expect(page).to have_content(member.full_name)
    expect(page).to_not have_content('Delete Member')
  end
end