require 'rails_helper'

RSpec.describe 'New Member', type: :feature do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }
  let(:non_admin_user) { FactoryBot.create(:user, :approved) }

  scenario 'valid inputs' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: 'Joe'
    fill_in 'Last Name:', with: 'Bob'
    fill_in 'Email:', with: 'joe@example.com'
    fill_in 'Phone Number:', with: '01234567890'
    select region.name, from: 'Region:'
    select department.name, from: 'Department:'
    select classification.name, from: 'Classification:'
    select subgroup.name, from: 'Subgroup:'
    select position.role, from: 'Subgroup Role:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("Joe Bob was successfully created")
    visit members_path
    expect(page).to have_content('Joe Bob')
    expect(page).to have_content('joe@example.com')
    expect(page).to have_content('01234567890')
    expect(page).to have_content(region.name)
    expect(page).to have_content(department.name)
    expect(page).to have_content(classification.name)
    expect(page).to have_content(subgroup.name)
  end

  scenario 'invalid inputs first name' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: ''
    fill_in 'Last Name:', with: 'Bob'
    fill_in 'Email:', with: 'joe@example.com'
    fill_in 'Phone Number:', with: '01234567890'
    select region.name, from: 'Region:'
    select department.name, from: 'Department:'
    select classification.name, from: 'Classification:'
    select subgroup.name, from: 'Subgroup:'
    select position.role, from: 'Subgroup Role:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("First name can't be blank")
  end


  scenario 'invalid inputs last name' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: 'Joe'
    fill_in 'Last Name:', with: ''
    fill_in 'Email:', with: 'joe@example.com'
    fill_in 'Phone Number:', with: '01234567890'
    select region.name, from: 'Region:'
    select department.name, from: 'Department:'
    select classification.name, from: 'Classification:'
    select subgroup.name, from: 'Subgroup:'
    select position.role, from: 'Subgroup Role:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("Last name can't be blank")
  end


  scenario 'invalid inputs email' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: 'Joe'
    fill_in 'Last Name:', with: 'Bob'
    fill_in 'Email:', with: ''
    fill_in 'Phone Number:', with: '01234567890'
    select region.name, from: 'Region:'
    select department.name, from: 'Department:'
    select classification.name, from: 'Classification:'
    select subgroup.name, from: 'Subgroup:'
    select position.role, from: 'Subgroup Role:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("Email can't be blank")
  end


  scenario 'invalid inputs first name' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: 'Joe'
    fill_in 'Last Name:', with: 'Bob'
    fill_in 'Email:', with: 'joe@example.com'
    fill_in 'Phone Number:', with: ''
    select region.name, from: 'Region:'
    select department.name, from: 'Department:'
    select classification.name, from: 'Classification:'
    select subgroup.name, from: 'Subgroup:'
    select position.role, from: 'Subgroup Role:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("Phone number can't be blank")
  end

  scenario 'invalid inputs Region' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: 'Joe'
    fill_in 'Last Name:', with: 'Bob'
    fill_in 'Email:', with: 'joe@example.com'
    fill_in 'Phone Number:', with: '01234567890'

    select department.name, from: 'Department:'
    select classification.name, from: 'Classification:'
    select subgroup.name, from: 'Subgroup:'
    select position.role, from: 'Subgroup Role:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("Region can't be blank")
    expect(page).to have_content("Region must exist")
  end

  scenario 'invalid inputs department' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: 'Joe'
    fill_in 'Last Name:', with: 'Bob'
    fill_in 'Email:', with: 'joe@example.com'
    fill_in 'Phone Number:', with: '01234567890'

    select region.name, from: 'Region:'
    select classification.name, from: 'Classification:'
    select subgroup.name, from: 'Subgroup:'
    select position.role, from: 'Subgroup Role:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("Department can't be blank")
    expect(page).to have_content("Department must exist")
  end

  scenario 'invalid inputs classification' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: 'Joe'
    fill_in 'Last Name:', with: 'Bob'
    fill_in 'Email:', with: 'joe@example.com'
    fill_in 'Phone Number:', with: '01234567890'

    select region.name, from: 'Region:'
    select department.name, from: 'Department:'
    select subgroup.name, from: 'Subgroup:'
    select position.role, from: 'Subgroup Role:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("Classification can't be blank")
    expect(page).to have_content("Classification must exist")
  end

  scenario 'invalid inputs missing subgroup' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: 'Joe'
    fill_in 'Last Name:', with: 'Bob'
    fill_in 'Email:', with: 'joe@example.com'
    fill_in 'Phone Number:', with: '01234567890'

    select classification.name, from: 'Classification:'
    select region.name, from: 'Region:'
    select department.name, from: 'Department:'

    select position.role, from: 'Subgroup Role:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("Subgroup must be chosen if a position is chose")
  end

  scenario 'invalid inputs missing subgroup role' do
    sign_in admin_user
    region = Region.create!(name: 'Atlantic')
    department = Department.create!(name: 'Health Canada')
    classification = Classification.create!(name: 'PC' )
    subgroup = Subgroup.create!(name: 'SP Gander')
    position = Position.create!(role: 'President')
    executive = Executive.create!(role: 'Secretary')
    visit members_path
    click_on 'New Member'
    fill_in 'First Name:', with: 'Joe'
    fill_in 'Last Name:', with: 'Bob'
    fill_in 'Email:', with: 'joe@example.com'
    fill_in 'Phone Number:', with: '01234567890'

    select classification.name, from: 'Classification:'
    select region.name, from: 'Region:'
    select department.name, from: 'Department:'
    select subgroup.name, from: 'Subgroup:'
    select executive.role, from: 'SP Group Executive Role:'
    check('member_steward')
    check('member_bargaining')
    click_on 'Create Member'
    expect(page).to have_content("Position must be chosen if subgroup is chosen.")
  end

  scenario 'new steward visible without sign-in' do
    steward = FactoryBot.create(:member, :steward_member)
    visit members_path
    expect(page).to have_content(steward.full_name)
  end

  scenario 'non-steward not visible without sign-in' do
    non_steward = FactoryBot.create(:member)
    visit members_path
    expect(page).to_not have_content(non_steward.full_name)
  end

  scenario 'non-steward visible to admin user' do
    non_steward = FactoryBot.create(:member)
    sign_in admin_user
    visit members_path
    expect(page).to have_content(non_steward.full_name)
  end

  scenario 'unauthorized user' do
    sign_in non_admin_user
    visit new_member_path
    expect(page.status_code).to eq(403)
  end
end