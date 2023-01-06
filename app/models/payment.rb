class Payment < ApplicationRecord
  belongs_to :payee, class_name: Business
  belong_to :payer, class_name: Business
end
