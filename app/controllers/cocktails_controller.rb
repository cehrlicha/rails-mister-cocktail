class CocktailsController < ApplicationController
  before_action :set_cocktails, only: [:show, :destroy]
  def index
    @cocktails = Cocktail.all

     if !params[:search].nil? && !params[:search].empty?
      @cocktails = Cocktail.search(params[:search])
    end
  end

  def show
    @doses = @cocktail.doses
    @dose = Dose.new
    @ingredients = Ingredient.all.sort_by { |k| k['name']}
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
     @cocktail = Cocktail.new(cocktail_params)

     if  @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy

    redirect_to cocktails_path
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo, :photo_cache)
  end

  def set_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

end
