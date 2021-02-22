require 'rails_helper'

RSpec.describe "Employers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/employers/index"
      expect(response).to have_http_status(:success)
    end
  end

end
