import 'failure.dart';

class ServerException implements Exception {}

class NoInternetException implements Exception {}

class TimeOutException implements Exception {}

class CacheException implements Exception {}

class UnknownNetworkException implements Exception {}

class NotDataException implements Exception {}

class NoLocaltDataException implements Exception {}

extension MapperToFailureException on Exception {
  Failure toFailure() => Failure.exceptionToFailure(this);
}
