class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(published: TRUE, featured: TRUE).order(created_at: :desc).limit(5)
  end
end
