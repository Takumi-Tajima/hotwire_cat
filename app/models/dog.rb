class Dog < ApplicationRecord
  scope :default_order, -> { order(:id) }

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  class << self
    def ransackable_attributes(auth_object = nil)
      %w[name age]
    end
  end
end
