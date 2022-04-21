import 'package:flutter_template_clean_architecture/core/error/failure.dart';

class FailureMessageHandler {
  FailureMessageHandler._();

  static ErrorMessage getFailureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return ErrorMessage('Error', 'Ha ocurrido un error en el servidor.');
      case NoDataFailure:
        return ErrorMessage('Error', 'Recurso no encontrado');
      default:
        return ErrorMessage('Error', 'Ha ocurrido un error inesperado');
    }
  }
}

class ErrorMessage {
  final String tittle;
  final String message;

  ErrorMessage(this.tittle, this.message);
}
