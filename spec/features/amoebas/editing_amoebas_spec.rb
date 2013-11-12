require 'spec_helper'

describe "editing amoebas" do
  context "on the edit amoeba page" do
    before do
      Act.create([
        {:name => "Rings of Fire"},
        {:name => "Jugglers and Knives"},
        {:name => "Freakshow"}
      ])

      @amoeba = Amoeba.create(:name=>"Ricky")
      @amoeba.build_talent(:name=>'fast as hell')
      @amoeba.acts.build([
        {:name=>"Car_crash"},
        {:name=>"Smashup"}
      ])
      @amoeba.save

      visit edit_amoeba_path(@amoeba)
    end

    it "should have a form to edit the amoeba" do
      expect(page).to have_css("form#edit_amoeba_#{@amoeba.id}")
    end

    it "should display the amoeba's current values" do
      expect(find_field('amoeba[name]').value).to eq('Ricky')
      car_crash = find("#Car_crash")
      smashup = find('#Smashup')
      expect(car_crash).to be_checked
      expect(smashup).to be_checked
    end

    it "should update an amoeba when the form is submitted" do
      fill_in 'amoeba_name', with: "Ricky the Information Hoarder"
      check('Rings of Fire')
      uncheck('Smashup')

      click_button('Update Amoeba')

      expect(Amoeba.first.name).to eq("Ricky the Information Hoarder")
      expect(page).to have_content("Ricky the Information Hoarder")
      expect(page).to have_content("Car_crash")
      expect(page).to have_content("Rings of Fire")
      expect(page).to_not have_content("Freakshow")
      expect(page).to_not have_content("Smashup")
    end
  end
end
