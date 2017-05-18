class DosesController < ApplicationController
  before_action :set_doses, only: [:destroy]


  def create
    @dose = Dose.new(doses_params)

    if  @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render "cocktails/show"
    end

  end

  def destroy
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def doses_params
      params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def set_doses
    @dose = Dose.find(params[:id])
  end
end
