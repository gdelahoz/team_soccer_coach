class EmailException implements Exception {
  final String message;
  const EmailException([this.message = 'Este no es un email']);

  @override
  String toString() => "EmailException: $message";
}
