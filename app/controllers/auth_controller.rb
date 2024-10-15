class AuthController < ActionController::API
  def get_token
    render json: { token: Auth::Jwt.encode({ user_id: 1 }) }
  end

  def validate_token
    token = request.headers["Authorization"].split(" ").last
    payload = Auth::Jwt.decode(token)

    if payload[:user_id] != 1
      render json: { errors: e.message }, status: :unauthorized
    else
      render json: { success: "authorized" }, status: :ok
    end
  end
end
