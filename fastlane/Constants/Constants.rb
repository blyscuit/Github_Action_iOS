# frozen_string_literal: true

class Constants
  #################
  #### PROJECT ####
  #################
  
    #Project path
  def self.PROJECT_PATH
    './GithubActionDemo.xcodeproj'
  end

  def self.BUNDLE_ID_STAGING
    'com.confusians.GithubActionEmptyDemo'
  end

  def self.BUNDLE_ID_PRODUCTION
    'com.confusians.GithubActionEmptyDemo'
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
    ENV.fetch('DEVICE', 'iPhone 12 Pro Max')
  end

  # a scheme name for unit testing
  def self.UNIT_TESTS_SCHEME
    'GithubActionDemo Staging'
  end

  ##################
  #### FIREBASE ####
  ##################

  # a gsp files directory
  def self.GSP_DIRECTORY
    './'
  end

  # a gsp file name for staging
  def self.GSP_STAGING
    './GoogleService-Info.plist'
  end

  # a gsp file name for production
  def self.GSP_PRODUCTION
    './GoogleService-Info.plist'
  end

  # The path to the upload-symbols file of the Fabric app
  def self.BINARY_PATH
    './Pods/FirebaseCrashlytics/upload-symbols'
  end

  # a firebase app ID for Staging
  def self.FIREBASE_APP_ID_STAGING
    '1:728561715309:ios:f3a3222ffd652d602fd764'
  end

  # a firebase app ID for Production
  def self.FIREBASE_APP_ID_PRODUCTION
    '1:728561715309:ios:f3a3222ffd652d602fd764'
  end

  def self.FIREBASE_TESTER_GROUPS
    "CICD"
  end

  #################
  ### ARCHIVING ###
  #################

   # a developer portal team id
  def self.DEV_PORTAL_TEAM_ID
    '93QF44Z6JU'
  end

  # an staging environment scheme name
  def self.SCHEME_NAME_STAGING
    'GithubActionDemo Staging'
  end

  # a Production environment scheme name
  def self.SCHEME_NAME_PRODUCTION
    'GithubActionDemo'
  end

  # a App Store environment scheme name
  def self.SCHEME_NAME_APP_STORE
    'GithubActionDemo AppStore'
  end

  # an staging product name
  def self.PRODUCT_NAME_STAGING
    'GithubActionDemo Staging'
  end

  # a staging TestFlight product name
  def self.PRODUCT_NAME_STAGING_TEST_FLIGHT
    'GithubActionDemo TestFlight'
  end

  # a Production product name
  def self.PRODUCT_NAME_PRODUCTION
    'GithubActionDemo'
  end

  # a main target name
  def self.MAIN_TARGET_NAME
    'GithubActionDemo'
  end

  ##################
  ### DEV PORTAL ###
  ##################

  def self.DEV_PORTAL_APPLE_ID
    'blysxaye@icloud.com'
  end

  #####################
  ### App Store API ###
  #####################

  # App Store Connect API Key ID
  def self.APP_STORE_KEY_ID
    '9XD766354D'
  end

  # App Store Connect API Issuer ID
  def self.APP_STORE_ISSUER_ID
    '69a6de7f-8f98-47e3-e053-5b8c7c11a4d1'
  end

  #################
  #### KEYCHAIN ####
  #################

  # Keychain name
  def self.KEYCHAIN_NAME
    'github_action_keychain'
  end

  # a scheme name for unit testing
  def self.KEYCHAIN_PASSWORD
    'password'
  end
end