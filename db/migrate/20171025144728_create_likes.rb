class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.boolean :active, default: false
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
