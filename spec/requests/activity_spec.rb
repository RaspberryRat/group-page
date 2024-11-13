require 'rails_helper'

RSpec.describe "Activities", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/activity/index"
      expect(response).to have_http_status(:success)
    end
  end

end
