require 'recipe_repository'
require 'recipe'


def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do  
  before(:each) do 
    reset_recipes_table
  end
  
  it 'returns all recipes' do
    repo = RecipeRepository.new
    recipes = repo.all
      expect(recipes.length).to eq 2
      
      expect(recipes[0].name).to eq 'Pasta'
      expect(recipes[0].average_cooking_time).to eq '40'
      expect(recipes[0].rating).to eq '5'
      
      expect(recipes[1].name).to eq 'Burger'
      expect(recipes[1].average_cooking_time).to eq '20'
      expect(recipes[1].rating).to eq '4'
  end
  
  it 'returns single recipe pasta' do
    repo = RecipeRepository.new
    recipe = repo.find(1)
      expect(recipe.name).to eq 'Pasta'
      expect(recipe.average_cooking_time).to eq '40'
      expect(recipe.rating).to eq '5'
  end
  
  it 'returns single recipe burger' do
    repo = RecipeRepository.new
    recipe = repo.find(2)
      expect(recipe.name).to eq 'Burger'
      expect(recipe.average_cooking_time).to eq '20'
      expect(recipe.rating).to eq '4'
  end 
end