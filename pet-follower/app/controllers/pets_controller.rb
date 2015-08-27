class PetsController < ApplicationController
  before_action :verify_login, only: [:new, :create, :edit, :update]

  def index
    @pets = Pet.all
    render :index
  end

  def new
    @pet = Pet.new
    render :new
  end
  
  def create
    @pet = Pet.new(pet_params)
    @pet.animal_type.downcase!

    if @pet.save
      flash[:success] = ["You successfully created #{@pet.name}!"]
      redirect_to pet_url(@pet)
    else
      flash.now[:errors] = @pet.errors.full_messages
      render :new
    end
  end
  
  def edit
    @pet = Pet.find(params[:id])
    render :edit
  end
  
  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to pet_url(@pet)
    else
      flash.now[:errors] = @pet.errors.full_messages
      render :edit
    end
  end
  
  def show
    @pet = Pet.find(params[:id])
    render :show
  end
  
  def destroy
    @pet = Pet.find(params[:id])
  end
  
  private
  
  def pet_params
    params.require(:pet).permit(:name, :animal_type, :sex)
  end
end
