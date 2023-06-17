module AuthenticableGraphqlUser
    extend ActiveSupport::Concern
    include ExecutionErrorResponder
  
    private
  
    def authenticate(*)
      return true if current_user
  
      raise_unauthorized_error!
    end
  
    def authentication_error
      { message: "Invalid credentials", status: 401, code: :unauthorized }
    end
  
    def raise_unauthorized_error!
      raise execution_error(error_data: authentication_error)
    end
end

  