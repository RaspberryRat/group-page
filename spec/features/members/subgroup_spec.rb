require 'rails_helper'

RSpec.describe 'Members Bargaining Team', type: :feature do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }

  scenario 'Add member to subgroup' do
    member = FactoryBot.create(:member)
    subgroup = FactoryBot.create(:subgroup)
    position = FactoryBot.create(:position)
    visit subgroups_path
    expect(page).to have_content(subgroup.name)
    expect(page).to_not have_content(member.full_name)
    sign_in admin_user
    visit edit_member_path(member)
    select subgroup.name, from: 'Subgroup:'
    select position.role, from: 'Subgroup Role:'
    click_on 'Update Member'
    visit subgroups_path
    expect(page).to have_content("#{member.full_name} - #{position.role}")
  end

  scenario 'Remove member from subgroup' do
    member = FactoryBot.create(:member, :subgroup, :subgroup_position)
    Subgroup.create!(name: 'None')
    Position.create!(role: 'None')
    visit subgroups_path
    expect(page).to have_content(member.full_name)
    expect(page).to have_content(member.subgroup.name)
    sign_in admin_user
    visit edit_member_path(member)
    select 'None', from: 'Subgroup:'
    select 'None', from: 'Subgroup Role:'
    click_on 'Update Member'
    visit subgroups_path
    expect(page).to_not have_content(member.full_name)
    expect(page).to have_content(member.subgroup.name)
  end
end