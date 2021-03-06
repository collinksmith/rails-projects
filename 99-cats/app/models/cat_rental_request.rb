# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :datetime         not null
#  end_date   :datetime         not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :good_status
  validate :no_overlapping_approved
  validate :start_before_end_date

  after_initialize { status ||= "PENDING" }

  belongs_to(
    :cat,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: :Cat
  )

  def self.statuses
    ["APPROVED", "DENIED", "PENDING"]
  end

  def approve!
    begin
      ActiveRecord::Base.transaction do
        self.status = "APPROVED"
        save!
        overlapping_pending_requests.each do |request|
          request.deny!
        end
      end
    rescue ActiveRecord::RecordInvalid
      return false
    end
  end

  def deny!
    self.status = "DENIED"
    save!
  end

  def pending?
    status == "PENDING"
  end

  def start_date
    return false unless attributes["start_date"]
    attributes["start_date"].strftime('%Y-%m-%d')
  end

  def end_date
    return false unless attributes["end_date"]
    attributes["end_date"].strftime('%Y-%m-%d')
  end

  # private

  def good_status
    unless self.class.statuses.include?(status)
      errors[:status] << "Invalid status."
    end
  end

  def no_overlapping_approved
    if status == "APPROVED" && overlapping_approved_requests?
      errors[:status] << "Can't have overlapping_approved_requests"
    end
  end

  def overlapping_requests
    CatRentalRequest.where(["((start_date BETWEEN ? AND ?) OR
                             (end_date BETWEEN ? AND ?)) AND
                             cat_id = ? AND
                             id != ?",
                             start_date, end_date, start_date, end_date,
                             cat_id, id])
  end

  def overlapping_approved_requests?
    !overlapping_requests.where(status: "APPROVED").empty?
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def start_before_end_date
    unless start_date && end_date && start_date <= end_date
      errors[:dates] << "Can't have start date after end date"
    end
  end

end
