class Act < ActiveRecord::Base
  has_many :act_amoebas
  has_many :amoebas, :through => :act_amoebas
end
