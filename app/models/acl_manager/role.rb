module AclManager
  class Role < ActiveRecord::Base
    has_and_belongs_to_many :acls,
      class_name: AclManager::Acl.name,
      join_table: 'acl_manager_acls_roles',
      foreign_key: 'acl_manager_role_id',
      association_foreign_key: 'acl_manager_acl_id'

    validates :name, presence: true
    validates :name, uniqueness: true

    default_scope { where(active: true) }

    def included? acl
      acl_ids.include?(acl.id)
    end

    def name
      I18n.t("activerecord.attributes.acl_manager.role.#{super}", default: super)
    end
  end
end
