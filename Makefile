BUNDLE=rbenv exec bundle
LANG_VAR=LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
FASTLANE=$(LANG_VAR) $(BUNDLE) exec fastlane

setup:
	$(BUNDLE) install

generate: ## Generates the xcode project
	$(FASTLANE) generate

spm: ## Run all tests on Swift Package Manager
	swift build
	swift test

unit: ## Run only unit tests
	$(FASTLANE) unit --env $(platform)

doc: ## Generate docs
	$(FASTLANE) doc

wipe: ## Clean xcode temp files and shuts down simulators
	killall "Simulator" || true
	rm -rf ~/Library/Developer/Xcode/{DerivedData,Archives,Products}
	osascript -e 'tell application "iOS Simulator" to quit'
	osascript -e 'tell application "Simulator" to quit'
	xcrun simctl shutdown all
	xcrun simctl erase all

help: ## Show this list of commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
