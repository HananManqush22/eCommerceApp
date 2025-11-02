part of 'product_detail_cubit.dart';

@immutable
sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

class GetRatesLoadingState extends ProductDetailState {}

class GetRatesSuccessState extends ProductDetailState {}

class GetRatesErrorState extends ProductDetailState {
  final String error;

  GetRatesErrorState({required this.error});
}

class UpdateOrPostUserRateLoadingState extends ProductDetailState {}

class UpdateOrPostUserRateSuccessState extends ProductDetailState {}

class UpdateOrPostUserRateErrorState extends ProductDetailState {
  final String error;

  UpdateOrPostUserRateErrorState({required this.error});
}

class AddCommentLoadingState extends ProductDetailState {}

class AddCommentSuccessState extends ProductDetailState {}

class AddCommentErrorState extends ProductDetailState {
  final String error;

  AddCommentErrorState({required this.error});
}
