require 'spec_helper'

feature "Act" do
  context "index" do
    before do
      Act.create([{:name=>"Jump"},{:name=>"Roll"}])
      visit acts_path
    end

    it "should display all acts" do
      expect(page).to have_css("div li", :count => 2)
    end

    it "should have links to individual acts" do
      expect(page).to have_link("Jump", :href=>act_path(1))
    end
  end
end
