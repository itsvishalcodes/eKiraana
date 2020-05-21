class CustomerpersonalinfosController < ApplicationController
  before_action :set_customerpersonalinfo, only: [:show, :edit, :update, :destroy]
  # skip_before_action :ensure_login, only: [:new, :create]

  # GET /customerpersonalinfos
  # GET /customerpersonalinfos.json
  def index
    @customerpersonalinfos = current_user().customerpersonalinfo
  end

  # GET /customerpersonalinfos/1
  # GET /customerpersonalinfos/1.json
  def show
  end

  # GET /customerpersonalinfos/new
  def new
    @customerpersonalinfo = current_user().build_customerpersonalinfo
  end

  # GET /customerpersonalinfos/1/edit
  def edit
  end

  # POST /customerpersonalinfos
  # POST /customerpersonalinfos.json
  def create
    current_user
    @customerpersonalinfo = current_user().build_customerpersonalinfo(customerpersonalinfo_params)

    respond_to do |format|
      if @customerpersonalinfo.save
        format.html { redirect_to root_path, notice: 'Customerpersonalinfo was successfully created.' }
        format.json { render :show, status: :created, location: @customerpersonalinfo }
      else
        format.html { render :new }
        format.json { render json: @customerpersonalinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customerpersonalinfos/1
  # PATCH/PUT /customerpersonalinfos/1.json
  def update
    respond_to do |format|
      if @customerpersonalinfo.update(customerpersonalinfo_params)
        format.html { redirect_to root_path, notice: 'Customerpersonalinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @customerpersonalinfo }
      else
        format.html { render :edit }
        format.json { render json: @customerpersonalinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customerpersonalinfos/1
  # DELETE /customerpersonalinfos/1.json
  def destroy
    @customerpersonalinfo.destroy
    respond_to do |format|
      format.html { redirect_to customerpersonalinfos_url, notice: 'Customerpersonalinfo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customerpersonalinfo
      @customerpersonalinfo = current_user.customerpersonalinfo
    end

    # Only allow a list of trusted parameters through.
    def customerpersonalinfo_params
      params.require(:customerpersonalinfo).permit(:name, :phone, :address)
    end
end
