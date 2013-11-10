class CreateActAmoebas < ActiveRecord::Migration
  def change
    create_table :act_amoebas do |t|
      t.references :act
      t.references :amoeba

      t.timestamps
    end
  end
end
