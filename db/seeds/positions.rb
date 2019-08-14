positions=["出品中", "取引中", "売却済み", "出品停止中"]
positions.each do |position|
Position.create!(name:position)
end