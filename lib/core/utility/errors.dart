import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int status;

  const Failure({
    required this.status,
    required this.message,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({required super.status, required super.message});

  @override
  List<Object?> get props => [status, message];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({required super.status, required super.message});

  @override
  List<Object?> get props => [status, message];
}
