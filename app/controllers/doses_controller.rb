class DosesController < ApplicationController
  before_action :set_doses, only: [:destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if  @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end

  end

  def destroy

  end

  private

  def doses_params
      params.require(:dose).permit(:description)
  end

  def set_doses
    @dose = Dose.find(params[:id])
  end
end
