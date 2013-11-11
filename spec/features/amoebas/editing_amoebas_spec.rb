require 'spec_helper'

describe "editing amoebas" do
  context "on the edit amoeba page" do
    before do
      Act.create([
        {:name => "Rings of Fire"},
        {:name => "Jugglers and Knives"},
        {:name => "Freakshow"}
      ])
      Talent.create([
        {:name => "acrobat"},
        {:name => "contortionist"},
        {:name => "clown"},
        {:name => "juggler"},
        {:name => "freak"}
      ])

      @amoeba = Amoeba.create(:name=>"Ricky")
      @amoeba.acts.build([
        {:name=>"Car crash"},
        {:name=>"Smashup"}
      ])
      @amoeba.build_talent(:name=>"dropkick")
      @amoeba.save

      visit edit_amoeba_path(@amoeba)
    end

    it "should have a form to edit the amoeba" do
      expect(page).to have_css("form#edit_amoeba_#{@amoeba.id}")
    end

    it "should update an amoeba when the form is submitted" do
      fill_in 'amoeba_name', with: "Ricky the Information Hoarder"
      click_button('Update Amoeba')

      expect(Amoeba.first.name).to eq("Ricky the Information Hoarder")
      expect(page).to have_content("Ricky the Information Hoarder")
    end

    it "can add/remove an amoeba to/from acts"
  end
end
