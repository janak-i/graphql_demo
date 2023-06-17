# app/graphql/decorators/user_decorator.rb
module Decorators
    class UserDecorator
        def initialize(object)
            @object = object
        end
  
      def decorated_name
        byebug
        # Modify the behavior of the name field here
        prefix = "User: "
        "#{prefix}#{@object.name}"
      end
    end
    
end
