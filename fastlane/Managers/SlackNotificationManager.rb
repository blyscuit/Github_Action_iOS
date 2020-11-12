# frozen_string_literal: true

class SlackNotificationManager
  def initialize(fastlane:, url:, username:, icon_url:)
    @fastlane = fastlane
    @url = url
    @username = username
    @icon_url = icon_url
  end

  def post(message:)
    @fastlane.slack(message: message, slack_url: @url, username: @username, icon_url: @icon_url)
  end
end
