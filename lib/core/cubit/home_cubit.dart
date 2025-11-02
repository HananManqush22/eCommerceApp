import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/api_consumer.dart';
import 'package:e_commerce_app/core/api/end_point.dart';
import 'package:e_commerce_app/screens/products/logic/model/product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  ApiConsumer api;
  static HomeCubit get(context) => BlocProvider.of(context);
  List<ProductModel> productModel = [];
  getProducts() async {
    emit(GetProductLoadingState());
    try {
      var response = await api.get(url: productData);

      productModel = (response as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();

      emit(GetProductSuccessState());
    } catch (e) {
      log(e.toString());
      emit(GetProductErrorState(error: e.toString()));
    }
  }
}
