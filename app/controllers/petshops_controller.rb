class PetshopsController < ApplicationController
  before_action :set_petshop, only: [:show, :edit, :update, :destroy]

  # GET /petshops
  # GET /petshops.json
  def index
    @petshops = Petshop.all
  end

  # GET /petshops/1
  # GET /petshops/1.json
  def show
  end

  # GET /petshops/new
  def new
    @petshop = Petshop.new
  end

  # GET /petshops/1/edit
  def edit
  end

  # POST /petshops
  # POST /petshops.json
  def create
    @petshop = Petshop.new(petshop_params)

    respond_to do |format|
      if @petshop.save
        format.html { redirect_to @petshop, notice: 'Petshop was successfully created.' }
        format.json { render :show, status: :created, location: @petshop }
      else
        format.html { render :new }
        format.json { render json: @petshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petshops/1
  # PATCH/PUT /petshops/1.json
  def update
    respond_to do |format|
      if @petshop.update(petshop_params)
        format.html { redirect_to @petshop, notice: 'Petshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @petshop }
      else
        format.html { render :edit }
        format.json { render json: @petshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petshops/1
  # DELETE /petshops/1.json
  def destroy
    @petshop.destroy
    respond_to do |format|
      format.html { redirect_to petshops_url, notice: 'Petshop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petshop
      @petshop = Petshop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petshop_params
      params.require(:petshop).permit(:name)
    end
end
