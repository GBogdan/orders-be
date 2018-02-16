class Order < ApplicationRecord

  validates :description, :status, presence: true

  validates :status, inclusion: { in: %w(open pending delivered), message: "%{value} is not a valid status" }

  validates_with StatusValidator

end
