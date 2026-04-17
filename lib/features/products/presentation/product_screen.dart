import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../data/product_repository.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(ProductRepository())
        ..add(FetchProducts()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Products")),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {

            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductError) {
              return Center(child: Text(state.message));
            }

            if (state is ProductLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ProductBloc>().add(
                    RefreshProducts(),
                  );
                },
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];

                    return ListTile(
                      leading: Image.network(product.image),
                      title: Text(product.title),
                      subtitle: Text("\$${product.price}"),
                    );
                  },
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}