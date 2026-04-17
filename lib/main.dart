import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Auth/data/repositories/login_repository_impl.dart';
import 'Auth/presentation/bloc/auth_bloc.dart';
import 'core/app/routes/store_page_routes.dart';
import 'core/app/utils/app_theme.dart';
import 'core/network/dio_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ SINGLE instances (global)
  final DioClient dioClient = DioClient();
  final AuthRepository authRepository = AuthRepository(dioClient);

  runApp(
    BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(authRepository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruzz Digital',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}


