# Karasu 𓅂

Flashcard-based learning app influenced by the [spaced-repetition](https://en.wikipedia.org/wiki/Spaced_repetition)  methodology.


## Preview
![Deck round example](readme_media/karasu_greek.gif)

## How to run
Install [Flutter](https://docs.flutter.dev/get-started/install) and do:

```
$ flutter run
```

Make sure to have [Toshokan](https://github.com/XaviFP/toshokan) running.

## Generate OpenAPI Client

The Dart API client in `lib/api` is auto-generated from the OpenAPI spec. To regenerate:

```bash
# 1. Delete old API directory
rm -rf lib/api

# 2. Generate the Dart client with json_serializable
cd ..

docker run --user $(id -u) --rm -v "$PWD:/work" -w /work openapitools/openapi-generator-cli:latest generate \
  -i toshokan/api/openapi.yaml \
  -g dart-dio \
  -o karasu/lib/api \
  --additional-properties=pubName=toshokan_api,nullable=true,serializationLibrary=json_serializable

# 3. Update SDK version requirement to match Dart 3.8+
cd karasu
sed -i 's/sdk: .>=.*</sdk: '\''>=3.8.0 </' lib/api/pubspec.yaml

# 4. Generate json_serializable code (.g.dart files)
cd lib/api
flutter pub get
dart run build_runner build --delete-conflicting-outputs
cd ../..

# 5. Get main app dependencies
flutter pub get
```


## Regenerate localizations
```bash
flutter gen-l10n
```