require 'rails_helper'

RSpec.describe 'Pending user', type: :feature do

  let(:non_admin) { FactoryBot.create(:user, :approved) }

  scenario 'non-admin user is forbidden' do
    sign_in non_admin
    visit users_path
    expect(page.status_code).to eq(403)
  end

  scenario 'no login is forbidden' do
    visit users_path
    expect(page).to have_current_path(new_user_session_path)
  end
end