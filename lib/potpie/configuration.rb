module Potpie
  class Configuration
    # Base32 secret for unique code.
    # Defaults to random ROTP Base32,
    # always make sure this is replaced.
    attr_accessor :base32_secret

    # User specified email for unique code.
    # Defaults to nil, Potpie won't work without
    # a user specified email.
    attr_accessor :user_email

    def initialize
      @base32_secret = Potpie.random_base32
      @user_email    = nil
    end
  end
end
