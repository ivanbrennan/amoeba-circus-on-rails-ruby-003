require 'spec_helper'

feature "Amoeba" do
  context "show" do
    before do
      @amoeba = Amoeba.create(:name=>"Iggy", :generation=>3)
      @amoeba.acts.build([
        {:name=>"Spoon-catchers"},
        {:name=>"High-jump"},
        {:name=>"Moonwalk"}
      ])
      @amoeba.talent = Talent.new(:name=>"Slippery")
      @amoeba.save
      visit amoeba_path(@amoeba)
    end

    it "should display the amoeba's attributes" do
      expect(page).to have_content(@amoeba.name)
      expect(page).to have_content(@amoeba.generation)
      expect(page).to have_content(@amoeba.talent.name)
    end

    it "should have a link to split the amoeba" do
      expect(page).to have_link("split!", :href=>split_amoeba_path(@amoeba))
    end

    it "should display the amoeba's acts" do
      expect(page).to have_content("Spoon-catchers")
      expect(page).to have_content("High-jump")
      expect(page).to have_content("Moonwalk")
    end

    it "should have a link to edit the amoeba" do
      expect(page).to have_link("edit", :href=>edit_amoeba_path(@amoeba))
    end
  end
end
