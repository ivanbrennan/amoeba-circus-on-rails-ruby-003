require 'spec_helper'

describe Talent do
  it 'has a name' do
    Talent.create(:name => 'acrobat')
    expect(Talent.last.name).to eq('acrobat')
  end
end
