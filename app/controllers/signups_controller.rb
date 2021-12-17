class SignupsController < ApplicationController
    def create
        Signup.create!(signup_params)
        render json: Activity.find(params[:activity_id]), status: :created
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
