part of 'car_bloc.dart';

@immutable
sealed class CarEvent {}

class FetchCars extends CarEvent {}
