#!/bin/sh

mkdir ../executables

echo "#Cleaing old executables..."
{
    rm "../executables/Regex Tester.dmg"
} || {
    echo "Skipping cleaing old executables..."
}

echo "#building macos..."
flutter clean
flutter pub get
flutter build macos


echo "#Creating DMG..."
./create_mac_dmg.sh && open "../executables"