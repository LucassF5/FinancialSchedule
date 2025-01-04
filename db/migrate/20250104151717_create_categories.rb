class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description, limit: 99
      t.string :color, default: '#0085cf'

      t.timestamps
    end
  end
end
