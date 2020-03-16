class Country < ApplicationRecord
    self.table_name = "tblcountry"
    self.primary_key = "countryId"
end
