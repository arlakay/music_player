enum Flavor {
  PRODUCTION,
}

class Config {
  static Flavor appFlavor;

  static String get helloMessage {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return 'PROD';
      default:
        return 'PROD';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return 'https://itunes.apple.com';
      default:
        return 'https://itunes.apple.com';
    }
  }
}
