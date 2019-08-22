FactoryBot.define do

  factory :deal do
    charge_id        {}
    deal_at          {}
    position_id      {1}
    buyer_id         {}
    seller_id        {3}
    product_id       {5}
  end
end
