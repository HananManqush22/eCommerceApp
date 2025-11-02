import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/dio_consume.dart';
import 'package:e_commerce_app/core/api/end_point.dart';
import 'package:e_commerce_app/screens/product_details/logic/models/rate_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.api) : super(ProductDetailInitial());
  final DioConsume api;
  static ProductDetailCubit get(context) => BlocProvider.of(context);
  List<RateModel> rates = [];
  int averageRate = 0;
  int userRate = 5;
  String userId = Supabase.instance.client.auth.currentUser!.id;
  getRate(String id) async {
    emit(GetRatesLoadingState());
    try {
      var response = await api.get(url: rateProduct + id);
      rates = (response as List).map((e) => RateModel.fromJson(e)).toList();
      _getAverageRate();
      _getUserRate();

      emit(GetRatesSuccessState());
    } catch (e) {
      emit(GetRatesErrorState(error: e.toString()));
    }
  }

  void _getUserRate() {
    List<RateModel> userRates = rates.where((rate) {
      return rate.forUser == userId;
    }).toList();
    if (userRates.isNotEmpty) {
      userRate = userRates.first.rate!;
    }
  }

  void _getAverageRate() {
    if (rates.isNotEmpty) {
      for (var userRate in rates) {
        averageRate += userRate.rate!;
      }
      averageRate = (averageRate / rates.length).toInt();
    }
  }

  updateOrPostRate(String productId, Map<String, dynamic> rate) async {
    emit(UpdateOrPostUserRateLoadingState());
    try {
      if (_checkUserRate(productId)) {
        await api.patch(
          url: updateOrPostRateEndPoint(productId, userId),
          data: rate,
        );
      } else {
        await api.post(
          url: updateOrPostRateEndPoint(productId, userId),
          data: rate,
        );
      }
      emit(UpdateOrPostUserRateSuccessState());
    } catch (e) {
      log(e.toString());
      emit(UpdateOrPostUserRateErrorState(error: e.toString()));
    }
  }

  bool _checkUserRate(String productId) {
    if (rates.isNotEmpty) {
      for (var userRate in rates) {
        if (userRate.forUser == userId && userRate.forProduct == productId) {
          return true;
        }
      }
    }
    return false;
  }

  postComment(Map<String, dynamic> data) async {
    emit(AddCommentLoadingState());
    try {
      await api.post(url: commentsEndPoint, data: data);
      emit(AddCommentSuccessState());
    } catch (e) {
      log(e.toString());
      emit(AddCommentErrorState(error: e.toString()));
    }
  }
}
