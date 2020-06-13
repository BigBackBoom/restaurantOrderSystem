abstract class EnvConfigBase {
  String baseUrl;
}

class DevelopEnvConfig implements EnvConfigBase {
  @override
  String baseUrl = "http://54.178.30.126:3000/";
}

class StagingEnvConfig implements EnvConfigBase {
  @override
  String baseUrl = "base_url_stg";
}

class EnvConfig implements EnvConfigBase {
  @override
  String baseUrl = "base_url_prod";
}