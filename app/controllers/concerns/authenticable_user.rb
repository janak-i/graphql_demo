module AuthenticableUser
    
    def current_user
      @current_user ||= User.kept.find_by(id: payload["sub"]) if valid_to_authenticate?
    end
  
    private
  
    def valid_to_authenticate?
      token && payload && active_refresh_token?
    end
  
    def token
      @token ||= token_from_header || token_from_params
    end
  
    def token_from_header
      request.headers["Authorization"].to_s.match(/Bearer (.*)/).to_a.last
    end
  
    # not to use in production, just for test locally with Altair client
    def token_from_params
      request.params[:auth_token]
    end
  
    def payload
      @payload ||= JWT.decode(token, ENV.fetch("AUTH_SECRET_TOKEN"), true, algorithm: "HS256").first
    rescue JWT::DecodeError
      nil
    end
  
    def jti
      payload["jti"]
    end
  
    def active_refresh_token?
      @active_refresh_token ||= RefreshToken.active.exists?(jti: jti)
    end
end

  