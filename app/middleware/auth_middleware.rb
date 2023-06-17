class AuthMiddleware
    def initialize(app)
        @app = app
    end
    
    def call(env)
        bearer_token = env['HTTP_AUTHORIZATION']&.slice(7..-1)
        user = TokenService.verify_token(bearer_token)
        if user
            env[:current_user] = User.find(user[0]['user_id'])
        end
        
        @app.call(env)
    end
end

  