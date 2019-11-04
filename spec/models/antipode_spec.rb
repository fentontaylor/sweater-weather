require 'rails_helper'

describe Antipode do
  before :each do
    hash = {
      data: {
        id: '1',
        type: 'antipode',
        attributes: {
            lat: -22.3193039,
            long: -65.8306389
        }
      }
    }

    @antipode = Antipode.new(hash)
  end

  it 'can initialize with a hash' do
    expect(@antipode).to be_an_instance_of(Antipode)
  end

  it 'attributes' do
    expect(@antipode.latitude).to eq(-22.3193039)
    expect(@antipode.longitude).to eq(-65.8306389)
  end
end
