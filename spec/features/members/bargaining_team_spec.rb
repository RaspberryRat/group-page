require 'rails_helper'

RSpec.describe 'Members Bargaining Team', type: :feature do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }

  scenario 'bargaining members visible on page' do
    member = FactoryBot.create(:member, :bargaining_member)
    visit bargaining_team_path
    expect(page).to have_content(member.full_name)
  end

  scenario 'multiple bargaining members visible on page' do
    member1 = FactoryBot.create(:member, :bargaining_member)
    member2 = FactoryBot.create(:member, :bargaining_member)
    member3 = FactoryBot.create(:member, :bargaining_member)
    member4 = FactoryBot.create(:member, :bargaining_member)
    member5 = FactoryBot.create(:member, :bargaining_member)
    visit bargaining_team_path
    expect(page).to have_content(member1.full_name)
    expect(page).to have_content(member2.full_name)
    expect(page).to have_content(member3.full_name)
    expect(page).to have_content(member4.full_name)
    expect(page).to have_content(member5.full_name)
  end

  scenario 'change member to bargaining member and is visible on page' do
    member = FactoryBot.create(:member)
    visit bargaining_team_path
    expect(page).to_not have_content(member.full_name)
    sign_in admin_user
    visit edit_member_path(member)
    check('member_bargaining')
    click_on 'Update Member'
    click_on 'Log Out'
    visit bargaining_team_path
    expect(page).to have_content(member.full_name)
  end

  scenario 'remove bargaining status from member' do
    member = FactoryBot.create(:member, :bargaining_member)
    visit bargaining_team_path
    expect(page).to have_content(member.full_name)
    sign_in admin_user
    visit edit_member_path(member)
    uncheck('member_bargaining')
    click_on 'Update Member'
    click_on 'Log Out'
    visit bargaining_team_path
    expect(page).to_not have_content(member.full_name)
  end
end