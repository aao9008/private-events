class Event < ApplicationRecord
  validates :creator, :date, :name, presence: true

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end
