class HomesController < ApplicationController
before_action :set_home, only: [:show, :edit, :update, :destroy, :home, :json, :symbols, :ok, :name]
	
	def show
		begin
        	@apiresponse = HTTParty.get("https://api.stockfighter.io/ob/api/heartbeat", timeout: 1 )
        	@apiresponse = "The API is working"
    	rescue Net::ReadTimeout
        	@apiresponse = "API Timed Out!"
    	end
	end

	private
    	# Use callbacks to share common setup or constraints between actions.
    	def set_stockstatus
      		@apiresponse = Apiresponse.find(params[:id])
    	end
	
end
