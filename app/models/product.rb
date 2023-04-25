class Product < ApplicationRecord
    has_many :reviews
    accepts_nested_attributes_for :reviews
    validates :name, :category, :price, :description, :image, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :category, inclusion: { in: ["CR7", "Leo", "Ney"] }
end
