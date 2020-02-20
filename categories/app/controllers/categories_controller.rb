class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to lists_path
    else
      format.html { render 'new' }
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      notice = 'Successfully edited the category.'
      redirect_to lists_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to lists_url
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
