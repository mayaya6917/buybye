class Sell < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status

  validates :item, presence: true
  validates :status, presence: true
  validates :limit, presence: true
end
