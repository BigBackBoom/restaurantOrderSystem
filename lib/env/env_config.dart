abstract class EnvConfigBase {
  String baseUrl;
}

class DevelopEnvConfig implements EnvConfigBase {
  @override
  String baseUrl = "base_url_dev";
}

class StagingEnvConfig implements EnvConfigBase {
  @override
  String baseUrl = "base_url_stg";
}

class EnvConfig implements EnvConfigBase {
  @override
  String baseUrl = "base_url_prod";
}