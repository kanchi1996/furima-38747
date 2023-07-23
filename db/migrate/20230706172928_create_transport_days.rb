class CreateTransportDays < ActiveRecord::Migration[6.0]
  def change
    create_table :transport_days do |t|

      t.timestamps
    end
  end
end
