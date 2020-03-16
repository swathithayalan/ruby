class Payment < ApplicationRecord
    self.table_name = "tblpayment"
    self.primary_key = "paymentId"
end
