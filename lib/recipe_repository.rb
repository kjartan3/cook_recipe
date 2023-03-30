require_relative './recipe'

class RecipeRepository
    def all
      sql = 'SELECT * FROM recipes;'
      results = DatabaseConnection.exec_params(sql, [])

      recipes = []

      results.each { |record|
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.average_cooking_time = record['average_cooking_time']
        recipe.rating = record['rating']

        recipes << recipe
      }

      return recipes
    end
        
    def find(id)
      sql = "SELECT * FROM recipes WHERE id = #{id};"
      results = DatabaseConnection.exec_params(sql, [])
      
      results.each { |record|
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.average_cooking_time = record['average_cooking_time']
        recipe.rating = record['rating']
  
        return recipe
      }
    end
end