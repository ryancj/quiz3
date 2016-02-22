class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :idea, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
