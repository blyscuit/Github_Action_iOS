# frozen_string_literal: true

class GithubManager
	def initialize(
		fastlane:,
		repository_owner:, 
		repository_name:
	)
		@fastlane = fastlane
		@api_token = ENV["GITHUB_TOKEN"]
		@repository = "#{repository_owner}/#{repository_name}"
	end
	
	def add_and_push_tag(tag:)
		@fastlane.git_pull()
		@fastlane.add_git_tag(
			tag: tag
		)
		@fastlane.push_git_tags(
			tag: tag
		)
	end
	
	def create_pull_request(head_branch:, target_branch:, title:, description:)
		@fastlane.create_pull_request(
			api_token: @api_token,
			repo: @repository,
			title: title,
			body: description,
			head: head_branch,
			base: target_branch
		)
	end
end
