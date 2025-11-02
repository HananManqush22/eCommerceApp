part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class GetProductLoadingState extends HomeState {}

class GetProductSuccessState extends HomeState {}

class GetProductErrorState extends HomeState {
  final String error;

  GetProductErrorState({required this.error});
}
