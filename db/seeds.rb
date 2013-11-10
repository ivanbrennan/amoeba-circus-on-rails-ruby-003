# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

special_talents = Talent.create(
  [
    {:name => "acrobat"},
    {:name => "contortionist"},
    {:name => "clown"},
    {:name => "juggler"},
    {:name => "freak"}
  ]
)

acts = Act.create(
  [
    {:name => "Rings of Fire", :date => "20131112", :time => "10:30"},
    {:name => "Jugglers and Knives", :date => "20131117", :time => "7:00"},
    {:name => "Freakshow", :date => "20131119", :time => "5:15"}
  ]
)

earl   = Amoeba.create(:name => "Earl",   :generation => 1)
jake   = Amoeba.create(:name => "Jake",   :generation => 1)
amy    = Amoeba.create(:name => "Amy",    :generation => 1)
julius = Amoeba.create(:name => "Julius", :generation => 1)
jared  = Amoeba.create(:name => "Jared",  :generation => 1)
talia  = Amoeba.create(:name => "Talia",  :generation => 1)
anish  = Amoeba.create(:name => "Anish",  :generation => 1)
brian  = Amoeba.create(:name => "Brian",  :generation => 1)
billy  = Amoeba.create(:name => "Billy",  :generation => 1)
jenny  = Amoeba.create(:name => "Jenny",  :generation => 1)

acrobats = [earl, jake].collect do |amoeba|
  amoeba.talent = Talent.find_by(:name => "acrobat")
  amoeba.save
  amoeba
end

contortionists = [amy, julius].collect do |amoeba|
  amoeba.talent = Talent.find_by(:name => "contortionist")
  amoeba.save
  amoeba
end

clowns = [jared, talia].collect do |amoeba|
  amoeba.talent = Talent.find_by(:name => "clown")
  amoeba.save
  amoeba
end

jugglers = [anish, brian].collect do |amoeba|
  amoeba.talent = Talent.find_by(:name => "juggler")
  amoeba.save
  amoeba
end

freaks = [billy, jenny].collect do |amoeba|
  amoeba.talent = Talent.find_by(:name => "freak")
  amoeba.save
  amoeba
end

Act.find_by(:name => "Rings of Fire").amoebas = acrobats + contortionists
Act.find_by(:name => "Jugglers and Knives").amoebas = acrobats + jugglers
Act.find_by(:name => "Freakshow").amoebas = clowns + freaks
