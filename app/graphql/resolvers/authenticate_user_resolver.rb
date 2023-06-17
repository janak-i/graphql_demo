class Resolvers::AuthenticateUserResolver < GraphQL::Schema::Resolver
    argument :email, String, required: true
    argument :password, String, required: true
    
    type String, null: true
    
    def resolve(email:, password:)
        user = User.find_by(email: email)
        return unless user&.authenticate(password)
        token = TokenEncoder.encode(user_id: user.id)
        token
    end
end
  