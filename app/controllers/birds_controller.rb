class BirdsController < ApplicationController
  def index
    birds = Bird.all #instance variable is not necessary with Rails
    render json: birds
  end

#   def show
#     bird = Bird.find_by(id: params[:id])
#     # render json: bird
#       # To show just certain attributes of the birds:
#     # render json: {id: bird.id, name: bird.name, species: bird.species } OR
#     # render json: bird.slice(:id, :name, :species)
#       # Will work with an array of hashes:
#     render json: birds, only: [:id, :name, :species]
#   end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end

end