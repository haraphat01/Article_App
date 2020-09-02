require 'rails_helper'

RSpec.describe "Articles", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/article/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /article" do
    it "returns http success" do
      get "/article/article"
      expect(response).to have_http_status(:success)
    end
  end

end
