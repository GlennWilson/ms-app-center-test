# Add a new App and define a New test run at
# https://appcenter.ms/
#
# supply app_name and devices_slug from the new test run below
#
# run with sh apc-submit.sh
app_name="v-glenw/Buttons"
# devices_slug="v-glenw/nine2twelve"
devices_slug="9126e732"
test_series="azuredevops"
locale="en_US"

echo "app_name="${app_name}
echo "devices_slug="${devices_slug}
echo "test_series="${test_series}
echo "locale="${locale}

pwd

ls -al

rm -rf DerivedData

xcrun xcodebuild build-for-testing \
  -configuration Debug \
  -workspace Buttons.xcodeproj/project.xcworkspace \
  -sdk iphoneos \
  -scheme Buttons \
  -derivedDataPath DerivedData

appcenter test run xcuitest \
  --app "${app_name}" \
  --devices "${devices_slug}" \
  --test-series "${test_series}" \
  --locale "${locale}" \
  --build-dir DerivedData/Build/Products/Debug-iphoneos/ --debug --async
