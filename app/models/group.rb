class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  has_one_attached :image

  def total_amount
    expenses.sum('amount')
  end
end
