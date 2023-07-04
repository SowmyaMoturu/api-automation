function fn() {
  var env = karate.env;

  if (!env) {
    env = 'sit';
  }

  var apiConfig =  read('classpath:resources/apiURL.json')
  var config = {
    env: env,
    baseUrl: 'https://itunes.apple.com/',
    apiConfig:apiConfig
  }

  if (env == 'uat') {
    config.baseUrl = 'https://itunes.apple.com/'
  }

  karate.configure('connectTimeout', 5000)
  karate.configure('readTimeout', 5000)
  karate.configure('ssl', true)
  return config;
}