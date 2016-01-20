class AddChangeRealtimeToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :change_realtime, :decimal
  end
end