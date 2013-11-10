class AddTalentRefToAmoebas < ActiveRecord::Migration
  def change
    add_column :amoebas, :talent_id, :integer
  end
end
