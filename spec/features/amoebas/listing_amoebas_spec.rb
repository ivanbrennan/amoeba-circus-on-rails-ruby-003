require 'spec_helper'

describe "listing amoebas" do
  context "on the amoebas index page" do
    it "should display all the existing amoebas" do
      Amoeba.create(:name=>"Paul")
      Amoeba.create(:name=>"Clint")
      Amoeba.create(:name=>"Ginger")
      Amoeba.create(:name=>"Cindy")

      visit amoebas_path

      Amoeba.all.each do |amoeba|
        expect(page).to have_link(amoeba.name, :href=>amoeba_path(amoeba))
      end
    end
  end
end
