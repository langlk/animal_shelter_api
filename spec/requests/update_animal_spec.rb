require "rails_helper"

describe 'the update animal endpoint', type: :request do
  let!(:animal) { FactoryBot.create(:animal) }

  before do
    patch "/api/v1/animals/#{animal.id}", params: { name: "Ein" }
  end

  it "returns the updated animal object" do
    result = JSON.parse(response.body)
    expect(result['name']).to eq('Ein')
    expect(result['id']).to eq(animal.id)
  end

  it "returns status 200" do
    expect(response).to have_http_status(:success)
  end

  it "returns status 404 if animal cannot be found" do
    patch "/api/v1/animals/#{animal.id + 1}", params: { name: "Ein" }
    expect(response).to have_http_status(:not_found)
  end

  it "returns status 422 if animal cannot be updated" do
    patch "/api/v1/animals/#{animal.id}", params: { birthday: Date.today.next_day }
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
