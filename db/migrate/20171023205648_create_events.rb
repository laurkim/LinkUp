class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_brite_id
      t.string :url
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :image_url
      t.boolean :free
      t.integer :venue_id

      t.timestamps
    end
  end
end
