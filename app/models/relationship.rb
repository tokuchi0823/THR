class Relationship < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :plan, class_name: "User"
  validates :user_id, presence: true
  validates :plan_id, presence: true
end
