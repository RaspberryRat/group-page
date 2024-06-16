require 'rails_helper'

RSpec.describe 'Members Bargaining Team', type: :feature do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }

  scenario 'bargaining members visible on page' do
    member = FactoryBot.create(:member, :executive)
    visit executives_path
    expect(page).to have_content(member.full_name)
  end

  scenario 'multiple executive members visible on page' do
    member1 = FactoryBot.create(:member, :executive)
    member2 = FactoryBot.create(:member, :executive)
    member3 = FactoryBot.create(:member, :executive)
    member4 = FactoryBot.create(:member, :executive)
    member5 = FactoryBot.create(:member, :executive)
    visit executives_path
    expect(page).to have_content(member1.full_name)
    expect(page).to have_content(member2.full_name)
    expect(page).to have_content(member3.full_name)
    expect(page).to have_content(member4.full_name)
    expect(page).to have_content(member5.full_name)
  end

  scenario 'add executive position to member' do
    member = FactoryBot.create(:member)
    visit executives_path
    executive = Executive.create!(role: 'Secretary')
    expect(page).to_not have_content(member.full_name)
    sign_in admin_user
    visit edit_member_path(member)
    select executive.role, from: 'SP Group Executive Role:'
    click_on 'Update Member'
    click_on 'Log Out'
    visit executives_path
    expect(page).to have_content(member.full_name)
    expect(page).to have_content(executive.role)
  end

  scenario 'remove executive status from member' do
    member = FactoryBot.create(:member, :executive)
    Executive.create!(role: 'None')
    visit executives_path
    expect(page).to have_content(member.full_name)
    sign_in admin_user
    visit edit_member_path(member)
    select "None", from: 'SP Group Executive Role:'
    click_on 'Update Member'
    click_on 'Log Out'
    visit executives_path
    expect(page).to_not have_content(member.full_name)
  end
end