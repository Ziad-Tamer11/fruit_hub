class CustomException implements Exception {
  final String errMessage;

  CustomException({required this.errMessage});

  String toStirng() {
    return errMessage;
  }
}
