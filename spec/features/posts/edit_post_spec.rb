require 'rails_helper'

RSpec.describe 'Editing a post', type: :feature do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }
  let(:non_admin_user) { FactoryBot.create(:user, :approved) }
  let(:poster_user) { FactoryBot.create(:user, :approved, :can_post) }
  let(:post) { FactoryBot.create(:post) }

  scenario 'valid inputs' do
    sign_in admin_user
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', with: 'Fake Post'
    click_on 'Update Post'
    visit root_path
    expect(page).to have_content('Fake Post')
  end

  scenario 'invalid inputs' do
    sign_in admin_user
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', with: ''
    click_on 'Update Post'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'invalid inputs' do
    sign_in admin_user
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', with: '1234'
    click_on 'Update Post'
    expect(page).to have_content("Title is too short (minimum is 5 characters)")
  end

  scenario 'invalid user is forbidden' do
    sign_in non_admin_user
    visit edit_post_path(post)
    expect(page.status_code).to eq(403)
  end

  scenario 'valid inputs for poster user' do
    sign_in poster_user
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', with: 'Fake Post'
    click_on 'Update Post'
    visit root_path
    expect(page).to have_content('Fake Post')
  end
end