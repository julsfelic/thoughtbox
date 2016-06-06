require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should validate_confirmation_of(:password).on(:create) }
  it { should validate_length_of(:password).is_at_least(6).on(:create) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
