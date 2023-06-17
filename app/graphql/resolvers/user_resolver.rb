module Resolvers
    class UserResolver < GraphQL::Schema::Resolver
        argument :id, ID, required: true
        type Types::UserType, null: true
        def resolve(id:)
            user=User.find_by(id: id)
        end

        
    end
end 

