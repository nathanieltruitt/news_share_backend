# frozen_string_literal: true

module BaseApi::Role
  def role?(role)
    roles.any? { |r| r.slug.underscore.to_sym == role }
  end

  def add_role(role)
    return ServiceContract.error("Role must be a symbol!") if role.class.name.to_sym != :Symbol

    return ServiceContract.error("Role type '#{role}' is not available") unless Role.valid_role?(role)

    target_role = Role.find_by_slug(role)
    roles << target_role unless roles.include?(target_role)
    ServiceContact.success(roles)
  end

  def remove_role(role)
    return ServiceContract.error("Role must be a symbol") if role
  end

  def role_is_valid?(role)
    return false if role.class.name.to_sym != :Symbol && !Role.valid_role?(role)

    true
  end
end
