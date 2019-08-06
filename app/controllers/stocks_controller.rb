class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:login, :signup]
  #before_action :require_same_user, only:[:edit,:update,:destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @current_user = current_user
    @stocks = Stock.all
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @current_user = current_user
  end

  # GET /stocks/new
  def new
    @current_user = current_user
    @stock = Stock.new
    @user = current_user
  end

  # GET /stocks/1/edit
  def edit
    @current_user = current_user
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @current_user = current_user
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    @current_user = current_user
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @current_user = current_user
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:productType, :liters, :total, :user_id)
    end
end
