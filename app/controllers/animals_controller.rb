class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  # GET /animals/1.json
  def show; end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit; end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)
    respond_to do |format|
      if @animal.save
        format.json { render :show, status: :created, location: @animal }
      else
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.json { render :show, status: :ok, location: @animal }
      else
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    begin
      @animal.destroy
    rescue ActiveRecord::DeleteRestrictionError => errors
      render json: errors.message.humanize, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:name)
    end
end
