class StatusValidator < ActiveModel::Validator
  def validate(record)
    return unless record.status_changed?
    previous_status = record.status_was
    record.errors.add(:status, 'invalid') if previous_status == 'open' && record.status != 'pending'
    record.errors.add(:status, 'invalid') if previous_status == 'pending' && record.status != 'delivered'
  end
end
