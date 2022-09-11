class Order < ApplicationRecord
  belongs_to :order_unit
  has_many :order_details, dependent: :restrict_with_error

  def complete!
    total_without_tax = order_details.joins(:drink).sum('drinks.price')
    update!(
      total_without_tax:,
      total_with_tax: total_without_tax * 1.1,
      paid_at: Time.zone.now
    )
  end
end
