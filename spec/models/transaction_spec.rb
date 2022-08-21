require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject {
    described_class.new(
      name: "Anything",
      cpf: "002.499.082-55",
      state: "São Paulo",
      value: 1234
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a cpf" do
    subject.cpf = nil
    expect(subject).to_not be_valid
  end

  it "is must have a valid cpf" do
    subject.cpf = '9879879'
    expect(subject).to_not be_valid
  end

  it "is not valid without a state" do
    subject.state = nil
    expect(subject).to_not be_valid
  end

  it "is have to be a valid state" do
    subject.state = "Estado não válido"
    expect(subject).to_not be_valid
  end

  it "is not valid without a value" do
    subject.value = nil
    expect(subject).to_not be_valid
  end
end
