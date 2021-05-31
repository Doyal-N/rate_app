class CreateRates < ActiveRecord::Migration[6.1]
  #or use single table inheritance
  def change
    create_table :rates do |t|
      t.decimal :value, precision: 5, scale: 3, null: false

      t.timestamps
    end
  end
end
