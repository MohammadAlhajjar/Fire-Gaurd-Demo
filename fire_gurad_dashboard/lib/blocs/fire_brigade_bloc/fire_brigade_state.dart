part of 'fire_brigade_bloc.dart';

@immutable
sealed class FireBrigadeState {}

final class FireBrigadeInitial extends FireBrigadeState {}

class FireBrigadeLoading extends FireBrigadeState {}

class FireBrigadeSuccess extends FireBrigadeState {
  final List<FireBrigadeModel> fireBrigades;

  FireBrigadeSuccess({required this.fireBrigades});
}

class FireBrigadeError extends FireBrigadeState {
  final String errorMessage;

  FireBrigadeError({required this.errorMessage});
}