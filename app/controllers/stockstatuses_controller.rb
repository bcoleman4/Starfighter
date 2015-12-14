class StockstatusesController < ApplicationController
  before_action :set_stockstatus, only: [:show, :edit, :update, :destroy, :stocksresponse, :json, :symbols, :ok]

  
  def apistatus
    response = HTTParty.get("https://api.stockfighter.io/ob/api/heartbeat")
    ok = response.parsed_response["ok"] rescue false

    raise "Oh no the world is on fire!" unless ok
  end

  # GET /stockstatuses
  # GET /stockstatuses.json
  def index
    @stockstatuses = Stockstatus.all

      begin
        @apiresponse = HTTParty.get("https://api.stockfighter.io/ob/api/heartbeat", timeout: 1 )
        @apiresponse = "The API is working"
      rescue Net::ReadTimeout
        @apiresponse = "API Timed Out!"
      end
      #ok = response.parsed_response["ok"] rescue false

      begin  
        @venueresponse = HTTParty.get("https://api.stockfighter.io/ob/api/venues/TESTEX/heartbeat", timeout: 1 )
        @venueresponse = "The Venue is working"
      rescue Net::ReadTimeout
        @venueresponse = "Venue Timed Out!"
      end
      #ok = response.parsed_response["ok"] rescue false

      begin
        @orderbookesponse = HTTParty.get("https://api.stockfighter.io/ob/api/venues/TESTEX/stocks/FOOBAR", timeout: 1)
        @orderbookresponse = "The Orderbook is working"
      rescue Net::ReadTimeout
        @orderbookresponse = "Orderbook Timed Out!"
      end

      begin
        @stocksresponse = HTTParty.get("https://api.stockfighter.io/ob/api/venues/GMSPEX/stocks", timeout: 1)
      rescue Net::ReadTimeout
        @stocksresponse = "Venue Timed Out!"
        #@json = @stocksresponse.parsed_response
        
        #puts @json[:ok]

        #puts @json[:symbols]

      end
      

  end

  # GET /stockstatuses/1
  # GET /stockstatuses/1.json
  def show
  end

  # GET /stockstatuses/new
  def new
    @stockstatus = Stockstatus.new
  end

  # GET /stockstatuses/1/edit
  def edit
  end

  # POST /stockstatuses
  # POST /stockstatuses.json
  def create
    @stockstatus = Stockstatus.new(stockstatus_params)

    respond_to do |format|
      if @stockstatus.save
        format.html { redirect_to @stockstatus, notice: 'Stockstatus was successfully created.' }
        format.json { render :show, status: :created, location: @stockstatus }
      else
        format.html { render :new }
        format.json { render json: @stockstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stockstatuses/1
  # PATCH/PUT /stockstatuses/1.json
  def update
    respond_to do |format|
      if @stockstatus.update(stockstatus_params)
        format.html { redirect_to @stockstatus, notice: 'Stockstatus was successfully updated.' }
        format.json { render :show, status: :ok, location: @stockstatus }
      else
        format.html { render :edit }
        format.json { render json: @stockstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stockstatuses/1
  # DELETE /stockstatuses/1.json
  def destroy
    @stockstatus.destroy
    respond_to do |format|
      format.html { redirect_to stockstatuses_url, notice: 'Stockstatus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stockstatus
      @stockstatus = Stockstatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stockstatus_params
      params.require(:stockstatus).permit(:stuff)
    end
end
