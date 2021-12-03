class Api::V1::BaseController < ActionController::API

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def check_password
    @password = params[:password]
    if @password.match?(/^(?!.*(\w)\1{1,})(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()-+])[A-Za-z\d@$!%*?&]{9,}.+$/)
      success
    else
      error
    end
  end

  def success
    render json: { message: "your password is strong "},
    status: :ok
  end

  def error
    render json: { error: "make sure the password has:", 
                  requirement1: "at least 8 characters",
                  requirement2: "at least 1 lowercase character",
                  requirement3: "at least 1 uppercase character",
                  requirement4: "at least 1 number",
                  requirement5: "at least 1 special character",
                  requirement6: "no repeated characters in sequence"},
       status: :bad_request
  end

end