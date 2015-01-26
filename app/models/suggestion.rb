class Suggestion < ActiveRecord::Base
  belongs_to :facility
  belongs_to :department
  belongs_to :user

  scope :reviewed,   -> { where(reviewed: true) }
  scope :completed,  -> { where(completed: true) }
  scope :verified,   -> { where(verified: true) }
  scope :funded,     -> { where(funded: true) }
  
  validates :facility_id, presence: true
  validates :department_id, presence: true
  validates :current_state, presence: true
  validates :ideal_state, presence: true
  validates :benefits, presence: true
end
