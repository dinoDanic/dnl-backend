module Mutations 
  class CreateOrganization < BaseMutation
    argument :name, String, required: true
    argument :oib, String, required: true

    type Types::OrganizationType
    
    @current_user ||= User.find(session[:user_id])

    def resolve(name:, oib:) 
      organization = Organization.find_by(oib: oib)
      if !organization 
        Organization.create!(
          name: name,
          oib: oib,
        )
        puts(current_user, "TUUUUUUUUUUUUUUUUUUUUUUU AM")

      else 
        raise GraphQL::ExecutionError, "Organization with OIB: #{organization.oib} exists"
      end
    
    end
  end

end