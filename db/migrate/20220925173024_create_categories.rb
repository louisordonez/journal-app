class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :user, null: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
