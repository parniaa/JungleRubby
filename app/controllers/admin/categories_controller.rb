class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USER"], password: ENV["ADMIN_PASSWORD"]

  def index
    @categories = Category.all
  end

  def new
    @categories = Category.new
  end

  def create 
    @category = Category.new(categories_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'Product created!'
    else
      render :new
    end
  end

  private 
  def categories_params
    params.require(:category).permit(
      :name
    )
  end

end 