require 'rails_helper'

RSpec.describe 'Edit Member', type: :feature, js:true do


  scenario 'filter member with region' do
    region1 = Region.create(name: 'Ontario')
    region2 = Region.create(name: 'Atlantic')
    member1 = FactoryBot.create(:member,  :steward_member, region: region1)
    member2 = FactoryBot.create(:member, :steward_member, region: region2)

    visit members_path
    expect(page).to have_content(member1.full_name)
    expect(page).to have_content(member2.full_name)
    click_on 'Show Filters'
    select 'Ontario', from: Region
    click_on 'Filter'
    expect(page).to have_content(member1.full_name)
    expect(page).to_not have_content(member2.full_name)
  end

  scenario 'filter member with Department' do
    department1 = Department.create(name: 'NRCan')
    department2 = Department.create(name: 'Health Canada')
    member1 = FactoryBot.create(:member,  :steward_member, department: department1)
    member2 = FactoryBot.create(:member, :steward_member, department: department2)

    visit members_path
    expect(page).to have_content(member1.full_name)
    expect(page).to have_content(member2.full_name)
    click_on 'Show Filters'
    select 'NRCan', from: Department
    click_on 'Filter'
    expect(page).to have_content(member1.full_name)
    expect(page).to_not have_content(member2.full_name)
  end

  scenario 'filter member with classification' do
    class1 = Classification.create(name: 'SG-SRE')
    class2 = Classification.create(name: 'PC')
    member1 = FactoryBot.create(:member,  :steward_member, classification: class1)
    member2 = FactoryBot.create(:member, :steward_member, classification: class2)

    visit members_path
    expect(page).to have_content(member1.full_name)
    expect(page).to have_content(member2.full_name)
    click_on 'Show Filters'
    select 'SG-SRE', from: Classification
    click_on 'Filter'
    expect(page).to have_content(member1.full_name)
    expect(page).to_not have_content(member2.full_name)
  end

  scenario 'filter member with subgroup' do
    subgroup1 = Subgroup.create(name: 'Downtown Ottawa')
    subgroup2 = Subgroup.create(name: 'Gander')
    member1 = FactoryBot.create(:member, :subgroup_position,  :steward_member, subgroup: subgroup1)
    member2 = FactoryBot.create(:member, :subgroup_position, :steward_member, subgroup: subgroup2)

    visit members_path
    expect(page).to have_content(member1.full_name)
    expect(page).to have_content(member2.full_name)
    click_on 'Show Filters'
    select 'Gander', from: Subgroup
    click_on 'Filter'
    expect(page).to have_content(member2.full_name)
    expect(page).to_not have_content(member1.full_name)
  end

  scenario 'filter member with region, with multiple results' do
    region1 = Region.create(name: 'Ontario')
    region2 = Region.create(name: 'Atlantic')
    member1 = FactoryBot.create(:member,  :steward_member, region: region1)
    member2 = FactoryBot.create(:member, :steward_member, region: region2)
    member3 = FactoryBot.create(:member,  :steward_member, region: region1)
    member4 = FactoryBot.create(:member, :steward_member, region: region2)
    member5 = FactoryBot.create(:member,  :steward_member, region: region1)
    member6 = FactoryBot.create(:member, :steward_member, region: region2)

    visit members_path
    expect(page).to have_content(member1.full_name)
    expect(page).to have_content(member2.full_name)
    expect(page).to have_content(member3.full_name)
    expect(page).to have_content(member4.full_name)
    expect(page).to have_content(member5.full_name)
    expect(page).to have_content(member6.full_name)
    click_on 'Show Filters'
    select 'Ontario', from: Region
    click_on 'Filter'
    expect(page).to have_content(member1.full_name)
    expect(page).to_not have_content(member2.full_name)
    expect(page).to have_content(member3.full_name)
    expect(page).to_not have_content(member4.full_name)
    expect(page).to have_content(member5.full_name)
    expect(page).to_not have_content(member6.full_name)
  end

  scenario 'filter member with region, with multiple parameters' do
    region1 = Region.create(name: 'Ontario')
    region2 = Region.create(name: 'Atlantic')
    department1 = Department.create(name: 'NRCan')
    department2 = Department.create(name: 'Health Canada')
    class1 = Classification.create(name: 'SG-SRE')
    class2 = Classification.create(name: 'PC')
    subgroup1 = Subgroup.create(name: 'Downtown Ottawa')
    subgroup2 = Subgroup.create(name: 'Gander')
    member1 = FactoryBot.create(:member, :steward_member, :subgroup_position, region: region1, department: department1, classification: class1, subgroup: subgroup1)
    member2 = FactoryBot.create(:member, :steward_member, :subgroup_position, region: region2, department: department2, classification: class2, subgroup: subgroup2)
    member3 = FactoryBot.create(:member, :steward_member, :subgroup_position, region: region1, department: department1, classification: class1, subgroup: subgroup1)
    member4 = FactoryBot.create(:member, :steward_member, :subgroup_position, region: region2, department: department2, classification: class2, subgroup: subgroup2)
    member5 = FactoryBot.create(:member, :steward_member, :subgroup_position, region: region1, department: department1, classification: class1, subgroup: subgroup1)
    member6 = FactoryBot.create(:member, :steward_member, :subgroup_position, region: region2, department: department2, classification: class2, subgroup: subgroup2)

    visit members_path
    expect(page).to have_content(member1.full_name)
    expect(page).to have_content(member2.full_name)
    expect(page).to have_content(member3.full_name)
    expect(page).to have_content(member4.full_name)
    expect(page).to have_content(member5.full_name)
    expect(page).to have_content(member6.full_name)
    click_on 'Show Filters'
    select 'Ontario', from: Region
    select 'NRCan', from: Department
    select 'SG-SRE', from: Classification
    select 'Downtown Ottawa', from: Subgroup
    click_on 'Filter'
    expect(page).to have_content(member1.full_name)
    expect(page).to_not have_content(member2.full_name)
    expect(page).to have_content(member3.full_name)
    expect(page).to_not have_content(member4.full_name)
    expect(page).to have_content(member5.full_name)
    expect(page).to_not have_content(member6.full_name)
  end
end
