require 'spec_helper'

feature "Act" do
  context "edit" do
    before do
      @act = Act.create(:name => "Rings of Fire", :date=>"soon", :time=>"early")
      @act.amoebas.build([{:name=>"Ricky"}, {:name=>"Julian"}])
      @act.save

      Amoeba.create(:name=>"Morton")
      visit edit_act_path(@act)
    end

    it "should have a form to edit the act" do
      expect(page).to have_css("form#edit_act_#{@act.id}")
    end

    it "should display the act's current values" do
      expect(find_field('act[name]').value).to eq('Rings of Fire')
      expect(find_field('act[date]').value).to eq('soon')
      expect(find_field('act[time]').value).to eq('early')

      expect(find('#Ricky')).to be_checked
      expect(find('#Julian')).to be_checked
      expect(find('#Morton')).to_not be_checked
    end

    it "should update an act when the form is submitted" do
      fill_in 'act_name', with: "Globs of Goo"
      fill_in 'act_date', with: "years away"
      fill_in 'act_time', with: "late"
      uncheck('Ricky')
      check('Morton')

      click_button('Update Act')

      expect(Act.first.name).to eq("Globs of Goo")
      expect(page).to have_content("Globs of Goo")
      expect(page).to have_content("Julian")
      expect(page).to have_content("Morton")
      expect(page).to_not have_content("Ricky")
    end
  end
end

