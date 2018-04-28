# 抽選済みカード
@already = []

# ユーザカード
@user = []
# ディーラーカード
@dealer = []

# カード抽選
def pickup_card()
  num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  suits = ["S", "H", "C", "D"]
  card = suits[rand(4)] + num[rand(13)].to_s
  # カードチェック
  if @already.include?(card)
    pickup_card()
  end
  return card
end

@already << pickup_card()
