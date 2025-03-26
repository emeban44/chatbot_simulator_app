class Endpoints {
  const Endpoints._();

  static const String _baseUrl = 'https://media.jefe-stg.idtm.io/programming-test/api';

  static String get inbox {
    return '$_baseUrl/inbox.json';
  }
}
