require 'spec_helper'

RSpec.describe Potpie do
  let!(:potpie_config) do
    {
      base32_secret: "base32secret3232",
      user_email:    "test@email.com"
    }
  end

  it "has a version number" do
    expect(Potpie::VERSION).not_to be nil
  end

  describe "#configuration" do
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

  describe "#generate" do
    before do
      Potpie.configure do |config|
        config.base32_secret = potpie_config.fetch(:base32_secret)
        config.user_email    = potpie_config.fetch(:user_email)
      end
    end

    describe "#qr_code" do
      it "returns a qr code" do
        # TODO: Not sure best way
      end
    end

    describe "#provisioned_uri" do
      context "user_email is present" do
        it "returns a provisioned uri" do
          expect(Potpie.generate.provisioned_uri).to_not be nil
        end
      end

      context "user_email is not present" do
        before do
          Potpie.configuration.user_email = nil
        end

        it "returns an error" do
          expect{ Potpie.generate.provisioned_uri }.to raise_error(ArgumentError)
        end
      end
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
