# 数字
num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

# マーク
suits = ["S", "H", "C", "D"]

# 抽選済みカード
already = []

# カード
# card = suits[rand(4)] + num[rand(13)].to_s

5.times do
  card = suits[rand(4)] + num[rand(13)].to_s
  unless already.include?(card)
    puts card
    already << card
  end
end
