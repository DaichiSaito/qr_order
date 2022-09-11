FactoryBot.define do
  factory :order do
    order_unit { nil }
    total_without_tax { '9.99' }
    total_with_tax { '9.99' }
    paid_at { '2022-07-16 20:34:37' }
  end
end
