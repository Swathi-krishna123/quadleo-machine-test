import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quadleo_machine_test/views/home/bloc/product_event.dart';
import 'package:quadleo_machine_test/views/home/bloc/product_state.dart';
import 'package:quadleo_machine_test/views/home/repository/home_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc({required this.repository}) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await repository.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
