Allows Flutter applications to interact with the
[DrMem control system](https://github.com/DrMemCS).

## Features

This package provides a widget which communicates with the DrMem control system.
The widget uses DrMem's client API to make requests and get replies. With this
widget, your application can:

- Auto detect instances of DrMem on the local network
- Query instances for
  - drivers available in the instance
  - devices available in the instance
- Obtain device readings and historical data
- Change the state of devices

The [DrMem Browser](https://github.com/DrMemCS/drmem_browser) is an example of an
application which uses this widget.

## Getting started

Add this and the `gql_code_builder` packages to your app's dependencies:

```yaml
dependencies:
  drmem_provider: ^0.1.0
  gql_code_builder: ^0.8.0
```

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

The author uses this widget on MacOS and Android targets. It should also work on
Linux, IOS, and Windows, but he doesn't have systems to test them on. The mDNS
dependent package doesn't support Web targets, so this package can't either.
