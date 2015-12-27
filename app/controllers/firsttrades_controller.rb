class FirsttradesController < ApplicationController
before_action :set_firsttrade, only: [:show, :edit, :update, :destroy,]

def index2
	apikey = "13abc0bfef9c61b1cf3605770c147b269049ab44"
	@who = HTTParty.get("https://api.stockfighter.io/ob/api",
		:headers => {"X-Starfighter-Authorization" => apikey}
	#@test2 = HTTParty.get("https://api.stockfighter.io/ob/api/venues/AFGEX/accounts/HFW68699432/orders", timeout: 1,
     #   :headers => {"X-Starfighter-Authorization" => apikey}
      #  )
	#@test = HTTParty.get("https://api.stockfighter.io/ob/api/venues/ETBAEX/stocks/WLY", timeout: 1,
	#	 :headers => {"X-Starfighter-Authorization" => apikey}
        
)
end


def index
	apikey = "13abc0bfef9c61b1cf3605770c147b269049ab44"
	venue = "FZEX"   # Replace this with your real value.
	stock = "JGI"  #Fun fact: Japanese programmers often use "hogehoge" where Americans use "foobar."  You should probably replace this with your real value.
	base_url = "https://api.stockfighter.io/ob/api"

	account = "KAW4147199"  # Printed in bold in the level instructions. Replace with your real value.

	# Set up the order

	order = {
  		"account" => account,
  		"venue" => venue,
  		"symbol" => stock,
  		"price" => 5000,  #$250.00 -- probably ludicrously high
  		"qty" => 100,
  		"direction" => "buy",
  		"orderType" => "limit"  # See the order docs for what a limit order is
	}

	@quote = HTTParty.get("#{base_url}/venues/#{venue}/stocks/#{stock}/quote")
	@response = HTTParty.post("#{base_url}/venues/#{venue}/stocks/#{stock}/orders",
                         :body => JSON.dump(order),
                         :headers => {"X-Starfighter-Authorization" => apikey}
                         )

	@resp = @response

	#Now we analyze the order response

	puts @response.body

	### Here is what the response looked like.

	# {
	#   "ok": true,
	#   "symbol": "HOGE",
	#   "venue": "FOOEX",
	#   "direction": "buy",
	#   "originalQty": 100,
	#   "qty": 0,
	#   "price": 25000,
	#   "orderType": "limit",
	#   "id": 6408,
	#   "account": "HB61251714",
	#   "ts": "2015-08-18T04:00:08.340298024+09:00",
	#   "fills": [
	#     {
	#       "price": 5960,
	#       "qty": 100,
	#       "ts": "2015-08-18T04:00:08.340299592+09:00"
	#     }
	#   ],
	#   "totalFilled": 100,
	#   "open": false
	# }

	# As we can see, I got 100 fills of the 100 shares I ordered.  Whee!
	# This order is now closed (open: false).
	end
end