class Either {
  final bool _success;
  final bool _hasError;
  final String _successMessage;
  final String _errorMessage;
  final String _errorCode;

  bool get eventIsSuccess => _success;

  bool get eventHasError => _hasError;

  String get getSuccessMsg => _successMessage;

  String get getErrMsg => _errorMessage;

  String get getErrCode => _errorCode;

  Either({success, hasError, successMessage, errorMessage, errorCode})
      : _success = success,
        _hasError = hasError,
        _successMessage = successMessage,
        _errorMessage = errorMessage,
        _errorCode = errorCode;
}
