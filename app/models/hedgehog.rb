class Hedgehog < ApplicationRecord
  scope :default_order, -> { order(:id) }
end
