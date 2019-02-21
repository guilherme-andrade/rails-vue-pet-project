class PetshopAnimalsController < ApplicationController
  before_action :set_petshop_animal, only: [:show, :edit, :update, :destroy]

  # GET /petshop_animals
  # GET /petshop_animals.json
  def index
    @petshop_animals = PetshopAnimal.all
  end

  # GET /petshop_animals/1
  # GET /petshop_animals/1.json
  def show
  end

  # GET /petshop_animals/new
  def new
    @petshop_animal = PetshopAnimal.new
  end

  # GET /petshop_animals/1/edit
  def edit
  end

  # POST /petshop_animals
  # POST /petshop_animals.json
  def create
    @petshop_animal = PetshopAnimal.new(petshop_animal_params)

    respond_to do |format|
      if @petshop_animal.save
        format.html { redirect_to @petshop_animal, notice: 'Petshop animal was successfully created.' }
        format.json { render :show, status: :created, location: @petshop_animal }
      else
        format.html { render :new }
        format.json { render json: @petshop_animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petshop_animals/1
  # PATCH/PUT /petshop_animals/1.json
  def update
    respond_to do |format|
      if @petshop_animal.update(petshop_animal_params)
        format.html { redirect_to @petshop_animal, notice: 'Petshop animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @petshop_animal }
      else
        format.html { render :edit }
        format.json { render json: @petshop_animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petshop_animals/1
  # DELETE /petshop_animals/1.json
  def destroy
    @petshop_animal.destroy
    respond_to do |format|
      format.html { redirect_to petshop_animals_url, notice: 'Petshop animal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petshop_animal
      @petshop_animal = PetshopAnimal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petshop_animal_params
      params.require(:petshop_animal).permit(:animal_id, :petshop_id)
    end
end
