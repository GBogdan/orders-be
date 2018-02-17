class Order < ApplicationRecord

  scope :by_status, -> (status) { where status: status }

  validates :description, :status, presence: true

  validates :status, inclusion: { in: %w(open pending delivered), message: "%{value} is not a valid status" }

  validates_with StatusValidator

end
