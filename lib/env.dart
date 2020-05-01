const bool isProduction = bool.fromEnvironment('dart.vm.product');

const testConfig = {
  'baseUrl': 'http://localhost:3000/'
};

const productionConfig = {
  'baseUrl': 'some-url.com/'
};

const environment = isProduction ? productionConfig : testConfig;