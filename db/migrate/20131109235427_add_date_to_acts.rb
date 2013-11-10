class AddDateToActs < ActiveRecord::Migration
  def change
    add_column :acts, :date, :string
  end
end
