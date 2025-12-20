class Cat < ApplicationRecord
  scope :default_order, -> { order(:id) }

  class << self
    def ransackable_attributes(auth_object = nil)
      %w[name age]
    end
  end
end
