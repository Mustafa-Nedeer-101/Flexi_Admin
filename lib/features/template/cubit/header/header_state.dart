part of 'header_cubit.dart';

@immutable
sealed class HeaderState {}

final class HeaderLoading extends HeaderState {}

final class HeaderSuccess extends HeaderState {
  final UserEntity user;

  HeaderSuccess({required this.user});
}

final class HeaderFailure extends HeaderState {
  final Failure failure;

  HeaderFailure({required this.failure});
}
