class DealerpersonalinfosController < ApplicationController
  before_action :set_dealerpersonalinfo, only: [:show, :edit, :update, :destroy]
  skip_before_action :ensure_login_user
  skip_before_action :ensure_login_delboy

  # GET /dealerpersonalinfos
  # GET /dealerpersonalinfos.json
  def index
    @dealerpersonalinfos = current_dealer().dealerpersonalinfo
  end

  # GET /dealerpersonalinfos/1
  # GET /dealerpersonalinfos/1.json
  def show
  end

  # GET /dealerpersonalinfos/new
  def new
    @dealerpersonalinfo = current_dealer().build_dealerpersonalinfo
  end

  # GET /dealerpersonalinfos/1/edit
  def edit
  end

  # POST /dealerpersonalinfos
  # POST /dealerpersonalinfos.json
  def create
    current_dealer
    @dealerpersonalinfo = current_dealer().build_dealerpersonalinfo(dealerpersonalinfo_params)

    respond_to do |format|
      if @dealerpersonalinfo.save
        format.html { redirect_to @dealerpersonalinfo, notice: 'Dealerpersonalinfo was successfully created.' }
        format.json { render :show, status: :created, location: @dealerpersonalinfo }
      else
        format.html { render :new }
        format.json { render json: @dealerpersonalinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dealerpersonalinfos/1
  # PATCH/PUT /dealerpersonalinfos/1.json
  def update
    respond_to do |format|
      if @dealerpersonalinfo.update(dealerpersonalinfo_params)
        format.html { redirect_to @dealerpersonalinfo, notice: 'Dealerpersonalinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @dealerpersonalinfo }
      else
        format.html { render :edit }
        format.json { render json: @dealerpersonalinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealerpersonalinfos/1
  # DELETE /dealerpersonalinfos/1.json
  def destroy
    @dealerpersonalinfo.destroy
    respond_to do |format|
      format.html { redirect_to dealerpersonalinfos_url, notice: 'Dealerpersonalinfo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealerpersonalinfo
      @dealerpersonalinfo = current_dealer().dealerpersonalinfo
    end

    # Only allow a list of trusted parameters through.
    def dealerpersonalinfo_params
      params.require(:dealerpersonalinfo).permit(:shopname, :rating, :phone, :review)
    end
end
