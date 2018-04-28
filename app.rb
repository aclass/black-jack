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
  if n > 10
    n = 10
  end
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
  @already << card
  return result
end

# バースト判定
def is_over(nums)
  result = false
  if nums.inject(:+) > 21
    result = true
  end
  return result
end

# 勝敗判定
def check_winner
  result = "user"
  user_num = @user.inject(:+)
  dealer_num = @dealer.inject(:+)
  if user_num < dealer_num
    result = "dealer"
  elsif user_num == dealer_num
    result = "draw"
  end
  return result
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

puts "あなたのカードの合計：#{@user.inject(:+)}"
puts "------------------------"
puts "カードを引きますか？ Y/N"
puts "------------------------"

input = gets.chomp
while input == "Y"
  card = pickup_card()
  @already << card[:card]
  @user << card[:num]
  puts "あなたの引いたカードは#{card[:card]}です"
  if is_over(@user)
    break;
  end
  puts "あなたのカードの合計：#{@user.inject(:+)}"
  puts "------------------------"
  puts "カードを引きますか？ Y/N"
  puts "------------------------"
  input = gets.chomp
end

# 勝敗判定
puts "ディーラーの2枚目のカード：#{@already[3]}"
puts "あなた：#{@user.inject(:+)}"
puts "ディーラー：#{@dealer.inject(:+)}"
case check_winner()
when "user"
  puts "あなたの勝ちです"
when "dealer"
  puts "ディーラーの勝ちです"
else
  puts "引き分けです"
end
