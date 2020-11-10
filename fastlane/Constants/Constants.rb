# frozen_string_literal: true

class Constants
  #################
  #### PROJECT ####
  #################
  
    #Project path
  def self.PROJECT_PATH
    './DeeMoney.xcodeproj'
  end

  def self.BUNDLE_ID_STAGING
    'com.swd.edeeremit.staging'
  end

  #################
  #### BUILDING ###
  #################

  # a derived data path
  def self.DERIVED_DATA_PATH
    './DerivedData'
  end

  # a build path
  def self.BUILD_PATH
    './Build'
  end
  
  #################
  #### TESTING ####
  #################

  # a device name
  def self.DEVICE
    ENV.fetch('DEVICE', 'iPhone 11 Pro Max')
  end

  # a scheme name for unit testing
  def self.UNIT_TESTS_SCHEME
    'DeeMoney Staging'
  end

  ##################
  #### FIREBASE ####
  ##################

  # a gsp files directory
  def self.GSP_DIRECTORY
    './Sources/Application/Configurations/Plists/GoogleService'
  end

  # a gsp file name for staging
  def self.GSP_STAGING
    '/Staging/GoogleService-Info-Staging.plist'
  end

  # a firebase app ID for Staging
  def self.FIREBASE_APP_ID_STAGING
    '1:250225431784:ios:9902b6fb04030a664be55d'
  end

  def self.FIREBASE_TESTER_GROUPS_DEEMONEY
    "CICD"
    # "testers, DeeMoney"
  end

  #################
  ### ARCHIVING ###
  #################

   # a developer portal team id
  def self.DEV_PORTAL_TEAM_ID
    '42C4WY65M6'
  end

  # an staging environment scheme name
  def self.SCHEME_NAME_STAGING
    'DeeMoney Staging'
  end

  # a Production environment scheme name
  def self.SCHEME_NAME_PRODUCTION
    'DeeMoney'
  end

  # an staging product name
  def self.PRODUCT_NAME_STAGING
    'DeeMoney Staging'
  end

  # a staging TestFlight product name
  def self.PRODUCT_NAME_STAGING_TEST_FLIGHT
    'DeeMoney TestFlight'
  end

  # a Production product name
  def self.PRODUCT_NAME_PRODUCTION
    'DeeMoney'
  end

  # a main target name
  def self.MAIN_TARGET_NAME
    'DeeMoney'
  end
end