require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it {should have_secure_password }
  it { should validates_presence_of :name}
  it { should validates_presence_of :email}
  it { should validates_uniqueness_of(:email).case_insensitive}
  it { should_not  allow_value('test').for(:email)}
  it { should allow_value('test@test.com').for(:email)}


end
