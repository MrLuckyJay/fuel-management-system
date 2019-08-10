class Stock < ApplicationRecord
  belongs_to :user

  validates :productType, presence: true,
              length: {minimum:3, maximum:250}

    validates :liters, presence: true,
              length: {minimum:2, }
end
