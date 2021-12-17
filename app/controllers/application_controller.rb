class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record 


  private

  def render_invalid_record
    render json: {errors: ["validation errors"]}, status: :unprocessable_entity
  end

end
