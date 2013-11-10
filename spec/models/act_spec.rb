require 'spec_helper'

describe Act do
  let(:act) { Act.create(:name=>'Firedance', :date=>'20131121', :time=>'4:30')}

  it 'has data attributes' do
    expect(act.name).to eq('Firedance')
    expect(act.date).to eq('20131121')
    expect(act.time).to eq('4:30')
  end

  it 'has many amoebas in an array' do
    act.amoebas = [
      Amoeba.new(:name=>"Jerry"),
      Amoeba.new(:name=>"Elaine")
    ]
    expect(act.amoebas.count).to eq(2)
    expect(act.amoebas.collect{ |a| a.name }).to include("Jerry")
  end

  it 'can build its amoebas through a method' do
    act.amoebas.build(:name=>"Sal")
    act.save
    expect(act.amoebas.count).to eq(1)
  end
end
