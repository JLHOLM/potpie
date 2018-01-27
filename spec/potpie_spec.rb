require 'spec_helper'

RSpec.describe Potpie do
  it "has a version number" do
    expect(Potpie::VERSION).not_to be nil
  end

  describe "#configuration" do
    let!(:potpie_config) do
      {
        base32_secret: "base32secret3232",
        user_email:    "test@email.com"
      }
    end

    before do
      Potpie.configure do |config|
        config.base32_secret = potpie_config.fetch(:base32_secret)
        config.user_email    = potpie_config.fetch(:user_email)
      end
    end

    it "sets the base32_secret" do
      expect(Potpie.configuration.base32_secret).to eq(potpie_config.fetch(:base32_secret))
    end

    it "sets the user_email" do
      expect(Potpie.configuration.user_email).to eq(potpie_config.fetch(:user_email))
    end
  end

  describe "#random_base32" do
    it "is not nil" do
      expect(Potpie.random_base32).not_to be nil
    end

    it "returns a random 16 character string" do
      expect(Potpie.random_base32.length).to eq(16)
    end
  end
end
