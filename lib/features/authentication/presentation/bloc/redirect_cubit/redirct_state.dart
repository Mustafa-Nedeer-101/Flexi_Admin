part of 'redirct_cubit.dart';

@immutable
sealed class RedirectState {}

final class RedirectInitial extends RedirectState {}

final class RedirectAuthenticated extends RedirectState {}

final class RedirectUnauthenticated extends RedirectState {}

final class RedirectFailure extends RedirectState {}
