require "recipe_repository"

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do
    reset_recipes_table
  end

  it "returns all recipes" do
    repo = RecipeRepository.new
    recipes = repo.all

    expect(recipes[0].name).to eq "Spaghetti"
    expect(recipes[0].cooking_time).to eq 10
    expect(recipes[0].rating).to eq 7

    expect(recipes[1].name).to eq "Dolma"
    expect(recipes[1].cooking_time).to eq 120
    expect(recipes[1].rating).to eq 10
  end

  it "returns a specific recipe using its ID" do
    repo = RecipeRepository.new
    recipe = repo.find(1)
    
    expect(recipe.name).to eq "Spaghetti"
    expect(recipe.cooking_time).to eq 10
    expect(recipe.rating).to eq 7
  end
end