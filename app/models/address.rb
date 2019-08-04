class Address < ApplicationRecord
  extend Active::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
