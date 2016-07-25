class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :latest_status, default: 0
      t.datetime :latest_pinged_at

      t.timestamps
    end
  end
end
