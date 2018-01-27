require 'potpie/configuration'
require 'potpie/generator'
require 'potpie/version'
require 'rotp'

module Potpie
  # @return [Potpie::Configuration] Potpie's current configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Set Potpie's configuration
  # @param config [Potpie::Configuration]
  def self.configuration=(config)
    @configuration = config
  end

  # Modify Potpie's current configuration
  # @yieldparam [Potpie::Configuration] config current Potpie config
  #
  # ```
  # Potpie.configure do |config|
  #   config.base32_secret = "base32secret3232"
  #   ...
  # end
  # ```
  def self.configure
    yield configuration
  end

  # Generate key for Google Authenticator
  # @return [Potpie::Generator] Potpie's key for Google Authenticator
  #
  # ```
  # Potpie.generate.provisioned_uri
  # Potpie.generate.qr_code
  # ```
  def self.generate
    if self.configuration.user_email.nil?
      raise ArgumentError.new "user_email cannot be nil"
    end

    @generator ||= Generator.new self.configuration
  end

  # Return current one time password value, 30sec interval between change
  # @return [Potpie::Generator] Potpie's current otp value.
  #
  # ```
  # Potpie.now
  # ```
  def self.now
    @generator.now
  end

  # Generate a random Base32 string
  # @return [Potpie.random_base32] random Base32 string
  def self.random_base32
    ROTP::Base32.random_base32
  end
end
