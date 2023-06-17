module Types
  class QueryType < GraphQL::Schema::Object
    field :user, resolver: Resolvers::UserResolver
    # field :users, resolver: Resolvers::UserResolver
  end
end