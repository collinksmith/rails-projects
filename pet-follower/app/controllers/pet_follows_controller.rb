class PetFollowsController < ApplicationController
  def create
    @pet_follow = PetFollow.new(pet_follow_params)

    if @pet_follow.save
      flash[:success] = ["You're now following #{@pet_follow.pet.name}. Congratulations!"]
    else
      flash[:errors] = @pet_follow.errors.full_message
    end

    redirect_to pets_url
  end

  def destroy
    @pet_follow = PetFollow.find_by(pet_id: params[:id])

    @pet_follow.destroy!
    flash[:notice] = ["You just unfollowed #{@pet_follow.pet.name}"]

    redirect_to pets_url
  end
  
  private
  
  def pet_follow_params
    params.require(:pet_follow).permit(:user_id, :pet_id)
  end
end
