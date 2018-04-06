class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :show_single]
  before_action :authenticate_user!, except: [:home, :show_single]

  # GET /animals
  def index
    @animals = Animal.all.where(user: current_user)
  end

  # GET /animals/1
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
    @species = Animal.species
    @statuses = Animal.statuses
  end

  # GET /animals/1/edit
  def edit
    @species = Animal.species
    @statuses = Animal.statuses
  end

  # POST /animals
  def create
    # create new animal and assign it to logged in user
    @animal = Animal.new(animal_params)
    current_user.animals << @animal

    @species = Animal.species
    @statuses = Animal.statuses

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /animals/1
  def update
    @species = Animal.species
    @statuses = Animal.statuses

    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /animals/1
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Animal was successfully destroyed.' }
    end
  end

  def home
    @animals = Animal.all.includes(:user).last(100)
  end

  def show_single
    render action: 'modal'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_animal
    @animal = Animal.find(params[:id])
  end

  # allowed params
  def animal_params
    params.require(:animal).permit(
        :name,
        :years,
        :breed,
        :description,
        :user_id,
        :species,
        :status,
        :main_image,
        :thumb_image
    )
  end
end
