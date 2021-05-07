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

  # The path to the upload-symbols file of the Fabric app
  def self.BINARY_PATH
    './Pods/FirebaseCrashlytics/upload-symbols'
  end

  # a firebase app ID for Staging
  def self.FIREBASE_APP_ID_STAGING
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

  # repository owner
  def self.REPOSITORY_OWNER
    'blyscuit'
  end

  # repository name
  def self.REPOSITORY_NAME
    'Github_Action_iOS'
  end
end