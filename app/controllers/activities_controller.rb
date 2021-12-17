class ActivitiesController < ApplicationController

    def index 
        render json: Activity.all, status: :ok
    end

    def destroy
        Activity.find(params[:id]).destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Activity not found" }, status: :not_found
    end
end
