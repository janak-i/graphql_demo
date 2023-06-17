module Types
  class MutationType < Types::BaseObject
    field :create_post, mutation: Mutations::CreatePost
    field :create_user, mutation: Mutations::CreateUser

    # field :update_user, mutation: Mutations::UpdateUser
    # field :deleteUser, mutation: Mutations::DeleteUser
  end

end