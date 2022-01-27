# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { from_user: nil, to_user: "ben", amount: 20000 },
  { from_user: nil, to_user: "brian", amount: 20000 },
  { from_user: "ben", to_user: "evan", amount: 9000 },
  { from_user: "brian", to_user: "anthony", amount: 7000 },
  { from_user: "evan", to_user: "anthony", amount: 400 },
  { from_user: "ben", to_user: "anthony", amount: 1500 },
  { from_user: "anthony", to_user: "ben", amount: 4500 },
  { from_user: "anthony", to_user: "evan", amount: 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

balances = {}


for transaction in blockchain
  if balances[transaction[:to_user].to_sym] == nil 
    balances[transaction[:to_user].to_sym] = 0 
  end
  balances[transaction[:to_user].to_sym] = balances[transaction[:to_user].to_sym] + transaction[:amount]
  
  
  
  if transaction[:from_user] != nil  # if from user in blockchain is not nil, do the rest
    if balances[transaction[:from_user].to_sym] == nil # if user in balances isn't in the hash already, do the rest
      balances[transaction[:from_user].to_sym] = 0 # set balance to 0 for user if they aren't nil in blockchain and if they aren't already in the hash
    end
    balances[transaction[:from_user].to_sym] = balances[transaction[:from_user].to_sym] - transaction[:amount] # udpate balance for user in balances to subtract blockchain amount if they aren't nil in the blockchain
  end
end

puts balances

# validate ben
puts 20000 - 9000 - 1500 + 4500