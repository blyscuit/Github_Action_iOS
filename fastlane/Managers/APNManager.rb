# frozen_string_literal: true

class APNManager
  def initialize(
    fastlane:,
    uat_bundle_id:,
    production_bundle_id:,
    dev_portal_apple_id:,
    dev_portal_team_id:,
    output:
  )
    @fastlane = fastlane
    @uat_bundle_id = uat_bundle_id
    @production_bundle_id = production_bundle_id
    @dev_portal_apple_id = dev_portal_apple_id
    @dev_portal_team_id = dev_portal_team_id
    @output = output
  end

  def pem_uat(development:, force:)
    pem(
      bundle_identifier: @uat_bundle_id,
      development: development,
      force: force
    )
  end

  def pem_production(development:, force:)
    pem(
      bundle_identifier: @production_bundle_id,
      development: development,
      force: force
    )
  end

  private

  def pem(bundle_identifier:, development:, force:)
    pem_name_components = ['apn']
    pem_name_components.push('development') if development
    pem_name_components.push(bundle_identifier)
    @fastlane.pem(
      app_identifier: bundle_identifier,
      development: development,
      force: force,
      pem_name: pem_name_components.join(' '),
      output_path: @output
    )
  end
end
