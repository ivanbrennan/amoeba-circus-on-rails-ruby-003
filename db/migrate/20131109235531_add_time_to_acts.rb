class AddTimeToActs < ActiveRecord::Migration
  def change
    add_column :acts, :time, :string
  end
end
