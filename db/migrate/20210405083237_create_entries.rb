class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.date :date
      t.decimal :amount
      t.time :start_time
      t.time :finish_time

      t.timestamps
    end
  end
end
