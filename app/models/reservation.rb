class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :people, numericality: true
    validates :start_date
    validates :end_date
  end

  validate :start_end_check
  validate :start_check

  def start_check
    if end_date.present? && start_date.present?
      if Date.today > start_date
        errors.add(:start_date, "は今日以降の日付を選択してください")
      else
        true
      end
    end
  end

  def start_end_check
    if end_date.present? && start_date.present?
      if start_date > end_date
        errors.add(:end_date, "は開始日以降の日付を選択してください")
      else
        true
      end
    end
  end
end
