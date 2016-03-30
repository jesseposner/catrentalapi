class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cats = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cats = Cat.create!(cat_params)
    redirect_to cat_url(@cats)
  end

  def edit
    @cats = Cat.find(params[:id])
    render :edit
  end

  def update
    @cats = Cat.find(params[:id])
    @cats.update!(cat_params)
    redirect_to cat_url(@cats)
  end


  private

  def cat_params
    params.
      require(:cat).
      permit(:name, :age, :sex, :description, :color, :birth_date)
  end
end
