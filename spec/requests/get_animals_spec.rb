require "rails_helper"

describe 'get animals endpoint', type: :request do
  let!(:animals) { FactoryBot.create_list(:animal, 10) }

  before do
    get '/api/v1/animals'
  end

  it "returns all animals" do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end
end
