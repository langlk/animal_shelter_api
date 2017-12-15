require "rails_helper"

describe 'the create animal endpoint' do
  before do
    post '/api/v1/animals', params: {
      name: 'Ravenna',
      species: 'Cat',
      sex: 'F',
      birthday: Date.today - 1.year,
      description: 'An elegant and calm black cat.',
      arrival_date: Date.today - 7.day
    }
  end

  it "returns created animal object" do
    animal_result = JSON.parse(response.body)
    expect(animal_result['id']).to_not be(nil)
    expect(animal_result['name']).to eq('Ravenna')
  end

  it "returns status 201" do
    expect(response).to have_http_status(:created)
  end

  it "returns status 422 if animal cannot be saved" do
    post '/api/v1/animals'
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
