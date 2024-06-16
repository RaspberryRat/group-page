require 'rails_helper'

RSpec.describe 'Destroying a post', type: :feature, js: true do

  let(:admin_user) { FactoryBot.create(:user, :admin_account, :approved) }
  let(:non_admin_user) { FactoryBot.create(:user, :approved) }
  let(:poster_user) { FactoryBot.create(:user, :approved, :can_post) }



  scenario 'valid inputs' do
    sign_in admin_user
    post = Post.create!(title: 'Fake Post')
    visit root_path
    expect(page).to have_content('Fake Post')
    visit post_path(post)
    click_on 'Delete Post'
    accept_alert
    visit root_path
    expect(page).to_not have_content('Fake Post')
  end

  scenario 'invalid user is forbidden' do
    sign_in non_admin_user
    post = Post.create!(title: 'Fake Post')
    visit post_path(post)
    expect(page).to_not have_content("Delete Post")
  end

  scenario 'valid inputs for poster user' do
    sign_in poster_user
    post = Post.create!(title: 'Fake Post')
    visit root_path
    expect(page).to have_content('Fake Post')
    visit post_path(post)
    click_on 'Delete Post'
    accept_alert
    visit root_path
    expect(page).to_not have_content('Fake Post')
  end
end