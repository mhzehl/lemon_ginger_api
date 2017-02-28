class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :amount
      t.boolean :optional
      t.references :recipe, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
