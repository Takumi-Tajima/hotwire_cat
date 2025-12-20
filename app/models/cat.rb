class Cat < ApplicationRecord
  scope :default_order, -> { order(:id) }
end
