class Chick < ApplicationRecord
  scope :default_order, -> { order(:id) }
end
