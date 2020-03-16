class Agency < ApplicationRecord
    self.table_name = "tblagency"
    self.primary_key = "agencyId"
    has_one :saasuser,  class_name: "SaasUser", foreign_key: "agencyId", primary_key: 'agencyId'
end
