class Facility < ActiveRecord::Base
  has_many :departments, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 45 }, uniqueness: true

end
