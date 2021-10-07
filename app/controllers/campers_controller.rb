class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers

    end

    def show
        camper = Camper.find_by(id:params[:id])
        render json: camper
    rescue
        render json: { error: "Camper not found" }, status: 404
    end
    
    def create
        camper = Camper.create(params.permit(:name, :age))
    if camper.valid?
        render json: camper, status: :created
    else
        render json: { "errors": camper.errors.full_messages }, status: 422
    end
end

end
