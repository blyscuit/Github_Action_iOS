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
		@fastlane.add_git_tag(
			tag: tag
		)
		@fastlane.push_git_tags(
			tag: tag
		)
	end
	
	def create_pull_request(head_branch:, target_branch:, title:, description:)
		@fastlane.create_pull_request(
			repo: @repository,
			title: title,
			body: description,
			base: target_branch
		)
	end

	# Develop Branch
	def DEVELOP_BRANCH
	  'develop'
	end
  
	# Origin Branch
	def MASTER_BRANCH
	  'master'
	end
  
	# Release Branch
	def RELEASE_BRANCH
	  'release'
	end
  
	# Bump version Comments
	def BUPM_BUNDLE_COMMENT(build:)
	  "Bump build number to #{build}"
	end
  
	# Bump version PR
	def BUPM_BUNDLE_PR(build:)
	  "[skip-CD] Bump build number to #{build}"
	end
end
