class CreateClocks < ActiveRecord::Migration[5.1]
  def change
    create_table :clocks do |t|
      t.datetime :countdown_to
      t.string :title
      t.text :description
      t.string :token
      t.string :slug
      t.boolean :public

      t.timestamps
    end
    add_index :clocks, :token, unique: true
    add_index :clocks, :slug, unique: true
  end
end
