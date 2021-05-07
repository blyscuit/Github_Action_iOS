# frozen_string_literal: true

class BuildManager
  def initialize(
    fastlane:,
    scheme_name_staging:,
    scheme_name_production:,
    bundle_identifier_staging:,
    product_name_staging:,
    product_name_staging_test_flight:,
    product_name_production:
  )
    @fastlane = fastlane
    @scheme_name_staging = scheme_name_staging
    @scheme_name_production = scheme_name_production
    @bundle_identifier_staging = bundle_identifier_staging
    @product_name_staging = product_name_staging
    @product_name_staging_test_flight = product_name_staging_test_flight
    @product_name_production = product_name_production
  end

  def build_app_ad_hoc(scheme, product_name)
    @fastlane.gym(
      scheme: scheme,
      export_method: 'ad-hoc',
      include_bitcode: false,
      output_name: product_name,
      disable_xcpretty: true
    )
  end

  def build_develop
    @fastlane.gym(
      scheme: @scheme_name_staging,
      export_method: 'ad-hoc',
      include_bitcode: false,
      output_name: @product_name_staging
    )
  end

  def build_staging_appstore
    @fastlane.gym(
      scheme: @scheme_name_staging,
      export_method: 'app-store',
      export_options: {
        provisioningProfiles: {
          @bundle_identifier_staging.to_s => "match AppStore #{@bundle_identifier_staging}"
        }
      },
      include_bitcode: false,
      output_name: @product_name_staging_test_flight
    )
  end

  def build_appstore
    @fastlane.gym(
      scheme: @scheme_name_production,
      export_method: 'app-store',
      export_options: {
        provisioningProfiles: {
          @bundle_identifier_staging.to_s => "match AppStore #{@bundle_identifier_staging}"
        }
      },
      include_bitcode: true,
      output_name: @product_name_production
    )
  end
end
