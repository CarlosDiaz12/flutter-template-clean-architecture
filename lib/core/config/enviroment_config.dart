// ignore_for_file: constant_identifier_names

class EnviromentConfig {
  static const API =
      String.fromEnvironment('API', defaultValue: 'http://localhost:3000/');
  static const APP_NAME = String.fromEnvironment('APP_NAME',
      defaultValue: ' AFP Siembra Afiliación Digital');
  static const SUFFIX = String.fromEnvironment('SUFFIX', defaultValue: '');
}
