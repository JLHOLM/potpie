module Potpie
  class Generator
    # Config params for Potpie.configuration
    # Base32_secret and user_email should be
    # provided for a code to be generated.
    attr_reader :config_params

    def initialize(config_params)
      @base32_secret = config_params.base32_secret
      @user_email = config_params.user_email
    end

    # Generates a scannable QR code.
    # @return [Potpie::Generator] Potpie's generated QR code.
    def qr_code
      # TODO
    end

    # Generates a key as a string for manual entry.
    # @return [Potpie::Generator] Potpie's generated key as a string.
    def provisioned_uri
      totp.provisioning_uri @user_email
    end

    private

    def totp
      ROTP::TOTP.new @base32_secret
    end
  end
end
