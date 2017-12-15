require "rails_helper"

describe 'the random animal endpoint', type: :request do
  let!(:animals) { FactoryBot.create_list(:animal, 10) }

  before do
    get '/api/v1/animals/random'
  end

  it "returns a single animal object" do
    expect(JSON.parse(response.body)['name']).to_not eq(nil)
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end
end
