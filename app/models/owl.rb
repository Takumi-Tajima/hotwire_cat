class Owl < ApplicationRecord
  scope :default_order, -> { order(:id) }
end
