require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }

  it { should belong_to(:user) }

  it 'should have a default read status of false' do
    link = Link.new(url: 'www.petrolhead.com', title: 'Petrolhead')

    expect(link.read).to eq false
  end

  it 'should only except valid URL formats' do
    invalid_link = Link.new(url: 'incorrect', title: 'Incorrect')
    valid_link = Link.new(url: 'www.petrolhead.com', title: 'Petrolhead')

    expect(invalid_link.valid?).to eq false
    expect(valid_link.valid?).to eq true
  end
end
