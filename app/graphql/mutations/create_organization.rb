module Mutations 
  class CreateOrganization < BaseMutation
    argument :name, String, required: true

    type Types::OrganizationType

    def resolve(name:) 
      if !organization = Organization.find_by(name: name)
        Organization.create!(
          name: name,
        )
      end
    end
  end

end