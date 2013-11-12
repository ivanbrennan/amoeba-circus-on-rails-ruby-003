class Amoeba < ActiveRecord::Base
  belongs_to :talent

  has_many :act_amoebas
  has_many :acts, :through => :act_amoebas

  def self.random_name
    names = %w(Reggie Peggie Egg-head Peg-leg Art Bart Stan Dan Pam Dragon Pollynut Astronut Colliflaur Sprillio Danilo Vanille Mille)
    "#{names.sample}-#{names.sample}"
  end
end
