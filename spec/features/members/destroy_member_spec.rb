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
end