FactoryBot.define do

  factory :product do
    name                  {"product1"}
    text                  {"product1-text"}
    price                 {1000}
    brand_id              {1}
    category_id           {1}
    size_id               {1}
    status                {"目立った傷や汚れなし"}
    shipping_fee_payer    {"送料込み（出品者負担）"}
    delivery_method       {"らくらくメルカリ便"}
    prefecture            {"北海道"}
    delivery_time         {"1~2日で発送"}
  end
end
