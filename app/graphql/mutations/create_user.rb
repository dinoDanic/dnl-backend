module Mutations 
  class CreateUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(email:, password:) 
      if !user = User.find_by(email: email)
        User.create!(
          email: email,
          password: password
        )
      end
    end
  end

end