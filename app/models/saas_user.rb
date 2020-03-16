class SaasUser < ApplicationRecord
    has_secure_password
    self.table_name = "tblsaasuser"
    self.primary_key = "saasUserId"
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }
    belongs_to :role, class_name: "Role",
              foreign_key: "roleId", primary_key: 'roleId'
    belongs_to :agency, class_name: "Agency",
              foreign_key: "agencyId", primary_key: 'agencyId'
end
