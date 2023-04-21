enum Environment {
  staging,
  production,
}

Environment environment = Environment.staging;

String get baseUrl {
  switch (environment) {
    case Environment.staging:
      return "https://www.alphavantage.co";
    case Environment.production:
      return "https://www.alphavantage.co";
  }
}

String get whatEnv {
  switch (environment) {
    case Environment.staging:
      return "staging";
    case Environment.production:
      return "prod";
  }
}
