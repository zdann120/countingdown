class AddTimezoneToClocks < ActiveRecord::Migration[5.1]
  def change
    add_column :clocks, :time_zone, :string
  end
end
