require "rails_helper"

describe 'the animal search path', type: :request do
  let!(:animal1) { FactoryBot.create(:animal, name: 'Cathy') }
  let!(:animal2) { FactoryBot.create(:animal, species: 'Cat') }
  let!(:animal3) { FactoryBot.create(:animal, description: 'Gets along with cats, other dogs.') }
  let!(:animal4) { FactoryBot.create(:animal) }

  before do
    get '/api/v1/animals/search', params: { term: 'cat' }
  end

  it "returns all animals with a name, description, or species that partially match the search term" do
    expect(JSON.parse(response.body).size).to eq(3)
  end

  it "returns status 200" do
    expect(response).to have_http_status(:success)
  end
end
