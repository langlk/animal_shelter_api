class Api::V1::AnimalsController < Api::V1::BaseController
  def index
    @animals = Animal.all
    json_response(@animals)
  end

  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def random
    @animal = Animal.random
    json_response(@animal)
  end

  def search
    @search_results = Animal.search(params[:term])
    json_response(@search_results)
  end

  def create
    @animal = Animal.create!(animal_params)
    json_response(
      {
        "message": "Animal with id=#{@animal.id} created successfully.",
        "animal": @animal
      },
      :created
    )
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      json_response(
        {
          "message": "Animal with id=#{@animal.id} updated successfully.",
          "animal": @animal
        }
      )
    else
      json_response(@animal.errors, :unprocessable_entity)
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    json_response(
      { "message": "Animal with id=#{@animal.id} deleted successfully." }
    )
  end

  private

  def animal_params
    params.permit(:name, :species, :sex, :birthday, :description, :arrival_date)
  end
end
