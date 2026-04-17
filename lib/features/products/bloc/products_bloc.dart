import 'package:ecommerce_desi/features/products/bloc/products_event.dart';
import 'package:ecommerce_desi/features/products/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/product_repository.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {

    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());

      try {
        final products = await repository.fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<RefreshProducts>((event, emit) async {
      try {
        final products = await repository.fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

  }
}