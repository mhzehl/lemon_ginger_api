class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @recipes = Recipe.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'Category was saved.'
    else
      render :index, alert: "Category couldn't be saved."
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category was updated.'
    else
      render :index, alert: "Category couldn't be updated."
    end
  end

  def destroy
    category = Category.find(params[:id])

    if category.destroy
      redirect_to admin_categories_path, notice: 'Category was deleted.'
    else
      redirect_to admin_categories_path, alert: "Category couldn't be deleted."
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
