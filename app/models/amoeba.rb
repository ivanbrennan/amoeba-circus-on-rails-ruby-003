class Amoeba < ActiveRecord::Base
  belongs_to :talent

  has_many :act_amoebas
  has_many :acts, :through => :act_amoebas
end
