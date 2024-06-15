require 'rails_helper'

describe Member do
  describe '#full_name' do
    it 'concatenates first and last name' do
      member = Member.new(first_name: 'John', last_name: 'Doe')
      expect(member.full_name).to eq('John Doe')
    end
  end

  describe '#role' do
    it 'returns role of position table' do
      member = FactoryBot.create(:member, :subgroup, :subgroup_position)
      expect(member.role).to eq(member.position.role)
    end
  end
end