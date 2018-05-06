class Event < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :user_id, presence: true
  validates :location, presence: true, length: {minimum: 10, maximum: 300}
  validates :price, presence: true
  validates :date, presence: true, numericality: { only_integer: true }, length: {minimum: 10, maximum: 10}, acceptance: { message: 'Invalid Format!' }
  
end