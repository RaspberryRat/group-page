require 'rails_helper'

RSpec.describe 'Edit Member', type: :feature do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }
  let(:non_admin_user) { FactoryBot.create(:user, :approved) }

  scenario 'valid inputs' do
    sign_in admin_user
    FactoryBot.create(:member)
    visit members_path
    click_on 'Edit Member'
    fill_in 'First Name:', with: 'Tuna'
    fill_in 'Last Name:', with: 'Fish'
    click_on 'Update Member'
    expect(page).to have_content( "Tuna Fish was successfully updated.")
  end

  scenario 'invalid inputs' do
    sign_in admin_user
    FactoryBot.create(:member)
    visit members_path
    click_on 'Edit Member'
    fill_in 'First Name:', with: ''
    fill_in 'Last Name:', with: 'Fish'
    click_on 'Update Member'
    expect(page).to have_content( "First name can't be blank")
  end

  scenario 'unauthorized user' do
    sign_in non_admin_user
    member = FactoryBot.create(:member)
    visit edit_member_path(member)
    expect(page.status_code).to eq(403)
  end

  scenario 'edit non-steward to steward' do
    non_steward = FactoryBot.create(:member)
    visit members_path
    expect(page).to_not have_content(non_steward.full_name)
    sign_in admin_user
    visit edit_member_path(non_steward)
    check('member_steward')
    click_on 'Update Member'
    click_on 'Log Out'
    visit members_path
    expect(page).to have_content(non_steward.full_name)
  end

  scenario 'edit steward to non-steward' do
    steward = FactoryBot.create(:member, :steward_member)
    visit members_path
    expect(page).to have_content(steward.full_name)
    sign_in admin_user
    visit edit_member_path(steward)
    uncheck('member_steward')
    click_on 'Update Member'
    click_on 'Log Out'
    visit members_path
    expect(page).to_not have_content(steward.full_name)
  end
end