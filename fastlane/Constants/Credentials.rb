# frozen_string_literal: true

require 'ostruct'

class Credentials
  class << self
    def OP_SUBDOMAIN
      credential(
        key: 'OP_SUBDOMAIN',
        description: 'a 1Password subdomain'
      )
    end

    def OP_EMAIL
      credential(
        key: 'OP_EMAIL',
        description: 'a 1Password email'
      )
    end

    def OP_SECRET
      credential(
        key: 'OP_SECRET',
        description: 'a 1Password Secret'
      )
    end

    def OP_MASTER_PASSWORD
      credential(
        key: 'OP_MASTER_PASSWORD',
        description: 'a 1Password Master password'
      )
    end

    def MATCH_PASSWORD
      credential(
        key: 'MATCH_PASSWORD',
        description: 'a mach password for encrypting and decrypting the provisiong profiles',
        one_password_title: 'Fastlane match password',
        one_password_field: 'password',
        one_password_vault: 'DeeMoney - General'
      )
    end    

    def FIREBASE_CLI_TOKEN
      credential(
        key: 'FIREBASE_TOKEN',
        description: 'a Firebase CLI token for firebase distribution',
        one_password_title: 'Firebase CLI Token',
        one_password_field: 'password',
        one_password_vault: 'DeeMoney - General'
      )
    end

    private def credential(key:, description:, one_password_title: nil, one_password_field: nil, one_password_vault: nil)
      OpenStruct.new(
        {
          key: key,
          value: ENV.fetch(key, nil),
          description: description,
          one_password_title: one_password_title,
          one_password_field: one_password_field,
          one_password_vault: one_password_vault
        }
      )
    end
  end
end
