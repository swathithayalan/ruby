class Role < ApplicationRecord
    self.table_name = "tblrole"
    self.primary_key = "roleId"
    has_one :saasuser,  class_name: "SaasUser", foreign_key: "roleId", primary_key: 'roleId'
end
