class CreatePings < ActiveRecord::Migration[5.0]
  def change
    create_table :pings do |t|
      t.references :site, foreign_key: true
      t.integer :status, default: 0
      t.datetime :pinged_at

      t.timestamps
    end
  end
end
