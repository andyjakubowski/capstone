class AddCategoryRefToTokens < ActiveRecord::Migration[6.0]
  def change
    add_reference :tokens, :category, foreign_key: true
  end
end
