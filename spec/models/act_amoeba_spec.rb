require 'spec_helper'

describe ActAmoeba do
  it 'references an act' do
    act = Act.new
    act.amoebas.build(:name=>"Harry")
    act.save
    expect(ActAmoeba.last.act).to eq(act)
  end

  it 'references an amoeba' do
    amoeba = Amoeba.new
    amoeba.acts.build(:name=>"Fire Pit")
    amoeba.save
    expect(ActAmoeba.last.amoeba).to eq(amoeba)
  end
end
