class Product < ApplicationRecord
  belongs_to :user

  validates :productName, presence: true,
              length: {minimum:3, maximum:250}

    validates :productPrice, presence: true,
              length: {minimum:2, }
end
