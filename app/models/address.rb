class Address < ApplicationRecord
  extend Active::Associations::ActiveRecordExtensions
  blongs_to_active_hash :prefecture
end
