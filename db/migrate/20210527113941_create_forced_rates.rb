class CreateForcedRates < ActiveRecord::Migration[6.1]
  def change
    create_table :forced_rates do |t|
      t.decimal :rate, precision: 5, scale: 3, index: { unique: true }, null: false
      t.datetime :show_until, null: false, index: true

      t.timestamps
    end
  end
end
