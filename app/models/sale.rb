class Sale < ApplicationRecord
  has_many :sale_details
  belongs_to :client
end
