class AddNameToActs < ActiveRecord::Migration
  def change
    add_column :acts, :name, :string
  end
end
