import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quadleo_machine_test/views/auth/bloc/auth_bloc.dart';
import 'package:quadleo_machine_test/views/auth/repository/auth_repo.dart';
import 'package:quadleo_machine_test/views/home/bloc/product_bloc.dart';
import 'package:quadleo_machine_test/views/home/repository/home_repo.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;

  const AppBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc(AuthRepository())),
        BlocProvider<ProductBloc>(
          create: (_) => ProductBloc(repository: ProductRepository()),
        ),
      ],
      child: child,
    );
  }
}
