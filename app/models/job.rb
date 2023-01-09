class Job < ApplicationRecord
  belongs_to :customer, class_name: "Business"
end
