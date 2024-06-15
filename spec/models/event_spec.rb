require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#start_time' do
    it 'returns date' do
      event = FactoryBot.create(:event)
      expect(event.start_time).to eq event.date
    end
  end

  describe '#past' do
    it 'returns past events' do
      event = FactoryBot.create(:event, :past)
      expect(Event.past).to include(event)
    end
    it 'returns multiple past events' do
      event1 = FactoryBot.create(:event, :past)
      event2 = FactoryBot.create(:event, :past)
      event3 = FactoryBot.create(:event, :past)
      expect(Event.past).to include(event1, event2, event3)
    end
    it 'does not future events' do
      event = FactoryBot.create(:event, :future)
      expect(Event.past).to_not include(event)
    end
  end

  describe '#future' do
    it 'returns future events' do
      event = FactoryBot.create(:event, :future)
      expect(Event.future).to include(event)
    end
    it 'returns multiple past events' do
      event1 = FactoryBot.create(:event, :future)
      event2 = FactoryBot.create(:event, :future)
      event3 = FactoryBot.create(:event, :future)
      expect(Event.future).to include(event1, event2, event3)
    end
    it 'does not future events' do
      event = FactoryBot.create(:event, :past)
      expect(Event.future).to_not include(event)
    end
  end
end