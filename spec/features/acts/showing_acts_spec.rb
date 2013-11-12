require 'spec_helper'

feature "Act" do
  context "show" do
    before do
      act = Act.new(:name=>"Jump", :date=>"soon")
      act.amoebas.build([{:name=>"Jerry"}, {:name=>"George"}])
      act.save
      visit act_path(1)
    end

    it "should display its date and all its amoebas" do
      expect(page).to have_content("Jerry")
      expect(page).to have_content("George")
      expect(page).to have_content("soon")
    end
  end
end
