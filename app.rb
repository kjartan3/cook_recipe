require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT * FROM recipes;'
result = DatabaseConnection.exec_params(sql, [])


recipe_repository = RecipeRepository.new

 
recipe_repository.all.each do |recipe|
  p recipe
end

# recipe = recipe_repository.find(2)

# puts recipe.id
# puts recipe.name
# puts recipe.average_cooking_time