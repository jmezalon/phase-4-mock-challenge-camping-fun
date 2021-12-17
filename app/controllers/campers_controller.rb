class CampersController < ApplicationController

    def index 
        render json: Camper.all, status: :ok 
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperShowSerializer, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Camper not found" }, status: :not_found
    end

    def create 
        render json: Camper.create!(camper_params), status: :created
    end

    private 

    def camper_params
        params.permit(:name, :age)
    end
end
