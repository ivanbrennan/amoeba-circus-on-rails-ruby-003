require 'spec_helper'

feature "Amoeba" do
  context "split" do
    before do
      @amoeba = Amoeba.create(:name=>"Ziggy-Stardust", :generation=>2)
      @amoeba.build_talent(:name=>'knife-throwing')
      @amoeba.save

      @parent_id = @amoeba.id

      visit amoeba_split_path(@amoeba)
      @children = Amoeba.last(2)
    end

    it "should destroy the parent amoeba" do
      expect {Amoeba.find(@parent_id)}.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find Amoeba with id=1")
    end

    it "shoud produce 2 new amoebas" do
      expect(@children.count).to eq(2)
    end

    it "shoud produce amoebas of the next generation" do
      expect(@children.all? {|child| child.generation == 3}).to eq(true)
    end

    it "shoud produce amoebas with the same talent" do
      expect(@children.all? {|child| child.talent.name == "knife-throwing"}).to eq(true)
    end
  end
end
