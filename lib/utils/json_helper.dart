class JsonHelper {
  const JsonHelper._();

  /// Used for cleaning up the json response if it
  /// has an invalid comma at the end of the array.
  static String cleanJson(String jsonString) {
    return jsonString.replaceAll(RegExp(r',\s*}'), '}').replaceAll(RegExp(r',\s*\]'), ']');
  }
}
