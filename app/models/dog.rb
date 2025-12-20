class Dog < ApplicationRecord
  scope :default_order, -> { order(:id) }
end
