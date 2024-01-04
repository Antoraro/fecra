.PHONY: clean get l10n build icons all

clean:
	flutter clean

get:
	flutter pub get

l10n:
	flutter gen-l10n

build:
	dart run build_runner build --delete-conflicting-outputs

icons:
	dart run flutter_launcher_icons
	dart run flutter_native_splash:create

all: clean get l10n build

gen: l10n build
