class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  belongs_to :category
  belongs_to :status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :schedule_delivery
  validates :category_id, :status_id, :fee_status_id, :prefecture_id, :schedule_delivery_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :name
    validates :info
    validates :price
    validates :image
  end
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力して下さい' }
end
