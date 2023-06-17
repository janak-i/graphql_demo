class TokenService
    def self.generate_token(user)
        payload = { user_id: user.id }
        expiration = Rails.application.config.jwt_expiration_time
        JWT.encode(payload, Rails.application.config.jwt_secret_key, 'HS256', exp: Time.now.to_i + expiration)
    end
    
    def self.verify_token(token)
        JWT.decode(token, Rails.application.config.jwt_secret_key, true, algorithm: 'HS256')
    rescue JWT::DecodeError, JWT::ExpiredSignature
        nil
    end
end
  