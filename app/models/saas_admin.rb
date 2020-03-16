class SaasAdmin < ApplicationRecord
    has_secure_password
    self.table_name = "tblSaasAdmin"
    self.primary_key = "userId"
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }
end
