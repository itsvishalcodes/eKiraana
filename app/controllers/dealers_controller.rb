class DealersController < ApplicationController
  before_action :set_dealer, only: [:show, :edit, :update, :destroy]
  skip_before_action :ensure_login_user, only: [:new, :create]
  skip_before_action :ensure_login_dealer, only: [:new, :create]

  # GET /dealers
  # GET /dealers.json
  def index
    @dealers = Dealer.all
  end

  # GET /dealers/1
  # GET /dealers/1.json
  def show
  end

  # GET /dealers/new
  def new
    @dealer = Dealer.new
  end

  # GET /dealers/1/edit
  def edit
  end

  # POST /dealers
  # POST /dealers.json
  def create
    @dealer = Dealer.new(dealer_params)

    # respond_to do |format|
    if Dealer.find_by(email: params[:dealer][:email])  != nil
      redirect_to new_dealer_path, alert: "Someone with this username already exist, Try another"
      return
    end
      
      if @dealer.save
      #   format.html { redirect_to @dealer, notice: 'Dealer was successfully created.' }
      #   format.json { render :show, status: :created, location: @dealer }
      # else
      #   format.html { render :new }
      #   format.json { render json: @dealer.errors, status: :unprocessable_entity }
      # end
        current_dealer = Dealer.find_by(email: params[:dealer][:email])
        password = params[:dealer][:password]
      end

    if current_dealer && current_dealer.authenticate(password)
      session[:dealer_id] = current_dealer.id
      redirect_to new_dealerpersonalinfo_path, notice: "Logged In as Dealer"
    else
      redirect_to dealerlogin_path, alert: "Wrong Credentials"
    end
  end

  # PATCH/PUT /dealers/1
  # PATCH/PUT /dealers/1.json
  def update
    respond_to do |format|
      if @dealer.update(dealer_params)
        format.html { redirect_to @dealer, notice: 'Dealer was successfully updated.' }
        format.json { render :show, status: :ok, location: @dealer }
      else
        format.html { render :edit }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealers/1
  # DELETE /dealers/1.json
  def destroy
    @dealer.destroy
    respond_to do |format|
      format.html { redirect_to dealers_url, notice: 'Dealer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealer
      @dealer = Dealer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dealer_params
      params.require(:dealer).permit(:email, :password)
    end
end
