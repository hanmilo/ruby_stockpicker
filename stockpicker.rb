# > stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12

def stock_picker(array_data) 
  max_profit = -array_data.max { |current_value, next_value| current_value <=> next_value } # preset 'max_profit' to the lowest possible value in 'array_data'
  # p max_profit
  day_buy = 0
  day_sell = 0
  array_day = []
  array_data.to_enum(:each_with_index).map { |current_value, day_buy_index|  #  enumerate through each vaue in 'array_data' and find the most profitable pair
    buy_value = current_value
    array_data.to_enum(:each_with_index).map { |next_value, day_sell_index| 
      sell_value = next_value
      profit = sell_value - buy_value
      if day_sell_index > day_buy_index && profit > max_profit then # taking account that 'day_buy' comes before 'day_sell'
        max_profit = profit 
        day_buy = day_buy_index
        day_sell = day_sell_index
      end
    }
  }
  array_day.push(day_buy)
  array_day.push(day_sell)
  return "#{array_day} for profit of $#{array_data[day_sell]} - $#{array_data[day_buy]} == $#{max_profit}" 
end

p stock_picker([17,3,6,9,15,8,6,1,10])