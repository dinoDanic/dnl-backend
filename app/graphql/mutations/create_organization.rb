module Mutations 
  class CreateOrganization < BaseMutation
    argument :name, String, required: true
    argument :oib, String, required: true

    type Types::OrganizationType

    def resolve(name:, oib:) 
      if !organization = Organization.find_by(oib: oib)
        Organization.create!(
          name: name,
          oib: oib,
        )
      end
    end
  end

end