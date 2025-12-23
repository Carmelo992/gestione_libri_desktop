#!/bin/zsh

dart pub global activate flutter_gen
cd model || exit
flutter pub get
dart run build_runner build
cd ..
cd view_model || exit
flutter pub get
cd ..
cd view || exit
flutter pub get
sh ./generate_assets.sh
cd ..
flutter pub get
sh ./strings_link.sh
sh ./go_router.sh
