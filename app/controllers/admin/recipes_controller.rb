class Admin::RecipesController < Admin::BaseController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_admin.recipes.build
    @recipe.ingredients.build
    @products = Product.all
    @recipe.cooking_steps.build
  end

  def create
    @recipe = current_admin.recipes.new(recipe_params)

    if @recipe.save
      photo_params.each do |image|
        @recipe.photos.create(image: image)
      end

      redirect_to admin_recipe_path(@recipe), notice: 'Recept is toegevoegd!'
    else
      @recipe.ingredients.build
      @products = Product.all
      @recipe.cooking_steps.build
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @photos = @recipe.photos
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      photo_params.each do |image|
        @recipe.photos.create(image: image)
      end

      redirect_to admin_recipe_path(@recipe), notice: 'Recept is geüpdatet.'
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])

    if recipe.destroy
      redirect_to admin_recipes_path, notice: 'Recept is verwijderd.'
    else
      redirect_to admin_recipes_path, alert: "Recept kon niet verwijderd worden."
    end
  end

  private

  def recipe_params

    params.require(:recipe).permit(:title, :subtitle, :intro, :cooking_time, :persons, :published, :featured, :week_recipe,
    ingredients_attributes: [:id, :product_id, :amount, :optional, :_destroy], cooking_steps_attributes: [:id, :title, :description, :cooking_time, :_destroy], category_ids: [])

  end

  def photo_params
      params[:photos].present? ? params.require(:photos) : []
  end

end
