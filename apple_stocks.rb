# Suppose we could access yesterday's stock prices as an array, where:
#
# The indices are the time in minutes past trade opening time, which was 9:30am local time.
# The values are the price in dollars of Apple stock at that time.
# So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.
#
# Write an efficient function that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.
#
# For example:
#
#   stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
#
# get_max_profit(stock_prices_yesterday)
# # returns 6 (buying for $5 and selling for $11)
#
# No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).

def get_max_profit(stock_prices_yesterday)

  if stock_prices_yesterday.length < 2
    raise IndexError, 'Getting a profit requires at least 2 prices'
  end

  min_price = stock_prices_yesterday[0]
  max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]

  stock_prices_yesterday.each_with_index do |current_price, index|
    if index == 0 then next end

    potential_profit = current_price - min_price

    max_profit = [max_profit, potential_profit].max
    min_price = [min_price, current_price].min
  end
  return max_profit
end
