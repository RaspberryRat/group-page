require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#post_date' do
    it 'returns created_at date when no date chosen' do
      post = FactoryBot.create(:post)
      expect(post.post_date).to eq(post.created_at)
    end
    it 'returns chosen date when date chosen' do
      post = FactoryBot.create(:post, :chosen_date)
      expect(post.post_date).to eq(post.date)
    end
    it 'does not return created_at date when date chosen' do
      post = FactoryBot.create(:post, :chosen_date)
      expect(post.post_date).to_not eq(post.created_at)
    end
  end
end