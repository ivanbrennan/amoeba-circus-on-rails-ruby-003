require 'spec_helper'

describe Amoeba do
  let(:amoeba) { Amoeba.create(:name=>'Amy', :generation=>3) }

  it 'has data attributes' do
    expect(amoeba.name).to eq('Amy')
    expect(amoeba.generation).to eq(3)
  end

  it 'can have a talent' do
    amoeba.talent = Talent.new(:name=>'juggling')
    expect(amoeba.talent.name).to eq('juggling')
  end

  it 'can build its talent through a method' do
    amoeba.build_talent(:name=>'clown')
    expect(amoeba.talent.name).to eq('clown')
  end

  it 'is in many acts' do
    amoeba.acts = [
      Act.new(:name=>"Spite and Vitreol"),
      Act.new(:name=>"Flying Squirrel Simulation")
    ]
    expect(amoeba.acts.count).to eq(2)
  end

  it 'can build its acts through a method' do
    amoeba.acts.build(:name=>"Lego Fortress")
    expect(amoeba.acts.collect { |act| act.name }).to include("Lego Fortress")
  end
end
