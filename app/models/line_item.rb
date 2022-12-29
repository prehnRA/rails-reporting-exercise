class LineItem < ApplicationRecord
  belongs_to :job
  belongs_to :invoice, optional: true
end
