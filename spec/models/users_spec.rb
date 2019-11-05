require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_confirmation_of :password }
  end

  it 'attributes' do
    user = User.create!(
      email: 'bob@ross.com',
      password: 'happy',
      password_confirmation: 'happy'
    )
    binding.pry
    expect(user.email).to eq('bob@ross.com')
    expect(user.api_key).to be_a String
    expect(user.api_key.length).to eq(48)
  end
end
