require 'rails_helper'

RSpec.describe "Earnings", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/earnings/index"
      expect(response).to have_http_status(:success)
    end
  end

end
