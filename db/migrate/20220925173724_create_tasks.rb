class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :category
      t.string :title
      t.string :description
      t.date :deadline
      
      t.timestamps
    end
  end
end
