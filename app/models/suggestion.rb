class Suggestion < ActiveRecord::Base
  belongs_to :facility
  belongs_to :department

  scope :reviewed,        -> { where(reviewed: true) }
  scope :completed,        -> { where(completed: true) }
  scope :verified,        -> { where(verified: true) }
  scope :funded,        -> { where(funded: true) }

end
