import 'dart:io';

import 'exception.dart';

abstract class Failure {
  final String? title;
  final String? message;

  final String? _originalException;
  Failure({this.title, this.message, String? exception})
      : _originalException = exception;

  String? get exceptionInfo => _originalException;

  factory Failure.exceptionToFailure(exception) {
    switch (exception.runtimeType) {
      case SocketException:
        return ServerFailure(exception: exception.toString());
      case NoInternetException:
        return NoInternetFailure(exception: exception.toString());
      case ServerException:
        return ServerFailure(exception: exception.toString());
      case NoDataException:
        return NoDataFailure(exception: exception.toString());
      default:
        return UnknownFailure(exception: exception.toString());
    }
  }
}

class NoDataFailure extends Failure {
  NoDataFailure({String? title, String? message, String? exception})
      : super(title: title, message: message, exception: exception);
}

class ServerFailure extends Failure {
  ServerFailure({String? title, String? message, String? exception})
      : super(title: title, message: message, exception: exception);
}

class NoInternetFailure extends Failure {
  NoInternetFailure({String? title, String? message, String? exception})
      : super(title: title, message: message, exception: exception);
}

class UnknownFailure extends Failure {
  UnknownFailure({String? title, String? message, String? exception})
      : super(title: title, message: message, exception: exception);
}
