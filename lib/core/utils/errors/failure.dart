abstract class Failure {
  final String message;

  Failure({required this.message});
}

// Local failures
class UnknownFailure extends Failure {
  UnknownFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class LogicFailure extends Failure {
  LogicFailure({required super.message});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.message});
}

class FormatFailure extends Failure {
  FormatFailure({required super.message});
}

class PlatformFailure extends Failure {
  PlatformFailure({required super.message});
}

// Network-related failures
class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}

class TimeoutFailure extends Failure {
  TimeoutFailure({required super.message});
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required super.message});
}

// Server-related failures
class ServerFailure extends Failure {
  final int? statusCode;

  ServerFailure({this.statusCode, required super.message});
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required super.message});
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({required super.message});
}

class ForbiddenFailure extends Failure {
  ForbiddenFailure({required super.message});
}

// Client-side errors (e.g., validation)
class ValidationFailure extends Failure {
  ValidationFailure({required super.message});
}

// Parsing-related failures
class ParsingFailure extends Failure {
  ParsingFailure({required super.message});
}
