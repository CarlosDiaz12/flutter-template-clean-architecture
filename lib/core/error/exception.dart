import 'failure.dart';

class ServerException implements Exception {}

class NoInternetErrorException implements Exception {}

class TimeOutException implements Exception {}

class CacheException implements Exception {}

class UnknownNetworkException implements Exception {}

class NotDataException implements Exception {}

extension MapperToFailureException on Exception {
  Failure toFailure() => Failure.exceptionToFailure(this);
}
