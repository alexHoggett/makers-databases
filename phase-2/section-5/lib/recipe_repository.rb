require "recipe"

class RecipeRepository
  def all
    sql = "SELECT * FROM recipes"
    result_set = DatabaseConnection.exec_params(sql, [])

    recipes = []

    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time'].to_i
      recipe.rating = record['rating'].to_i
      recipes << recipe
    end

    return recipes
  end

  def find(id)
    sql = "SELECT * FROM recipes WHERE id = $1"
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    recipe = Recipe.new
    recipe.id = result[0]['id']
    recipe.name = result[0]['name']
    recipe.cooking_time = result[0]['cooking_time'].to_i
    recipe.rating = result[0]['rating'].to_i

    return recipe
  end
end