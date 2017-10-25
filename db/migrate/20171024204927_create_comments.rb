class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :likes, default: 0
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
