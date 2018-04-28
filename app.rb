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
  n = num[rand(13)]
  s = suits[rand(4)]
  card = s + n.to_s
  result = {
    card: card,
    num: n
  }
  # カードチェック
  if @already.include?(result[:card])
    pickup_card()
  end
  return result
end

def check_num()

end

puts "start game!"

# カード配布
count = 1
2.times do
  user = pickup_card()
  @user << user[:num]
  puts "あなたの#{count}枚目のカードは#{user[:card]}です"

  dealer = pickup_card()
  @dealer << dealer[:num]
  if count == 2
    puts "ディーラーの#{count}枚目のカードはひみつです"
  else
    puts "ディーラーの#{count}枚目のカードは#{dealer[:card]}です"
  end
  count += 1
end

@already << pickup_card()
