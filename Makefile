BUNDLE=rbenv exec bundle
LANG_VAR=LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
FASTLANE=$(LANG_VAR) $(BUNDLE) exec fastlane

test: ## Run all tests
	bundle exec fastlane unit --env $(platform)
	bundle exec fastlane functional --env $(platform)
	bundle exec fastlane snapshot --env $(platform)
	bundle exec fastlane e2e --env $(platform)

unit: ## Run only unit tests
	bundle exec fastlane unit --env $(platform)

functional: ## Run only functional tests
	bundle exec fastlane functional --env $(platform)

snapshot: ## Run only snapshot tests
	bundle exec fastlane ui --env $(platform)

e2e: ## Run only e2e tests
	bundle exec fastlane e2e --env $(platform)

wipe: ## Clean xcode temp files and shuts down simulators
	killall "Simulator" || true
	rm -rf ~/Library/Developer/Xcode/{DerivedData,Archives,Products}
	osascript -e 'tell application "iOS Simulator" to quit'
	osascript -e 'tell application "Simulator" to quit'
	xcrun simctl shutdown all
	xcrun simctl erase all

help: ## Show this list of commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
