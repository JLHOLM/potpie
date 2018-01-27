require 'potpie/configuration'
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
  # end
  # ```
  def self.configure
    yield configuration
  end

  # Generate a random Base32 string
  # @return random Base32 string
  def self.random_base32
    ROTP::Base32.random_base32
  end
end
