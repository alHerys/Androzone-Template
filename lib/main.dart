import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as legacy_provider;

import 'app/config/router.dart';
import 'core/theme/app_theme.dart';
import 'features/counter_provider/view_models/provider_counter_notifier.dart';
import 'features/counter_bloc/cubit/bloc_counter_cubit.dart';
import 'features/auth/bloc/auth_cubit.dart';

void main() {
  // 1. Riverpod: Menggunakan ProviderScope di tingkat root untuk mengelola status
  // tanpa dependensi BuildContext. Riverpod memantau semua provider secara internal.
  runApp(
    const ProviderScope(
      child: MainAppRoot(),
    ),
  );
}

class MainAppRoot extends StatelessWidget {
  const MainAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Provider: Menggunakan MultiProvider untuk mengalirkan notifier ke widget tree.
    // Memerlukan BuildContext untuk mengakses data di bawahnya.
    return legacy_provider.MultiProvider(
      providers: [
        legacy_provider.ChangeNotifierProvider(
          create: (_) => ProviderCounterNotifier(),
        ),
      ],
      // 3. BLoC: Menggunakan MultiBlocProvider untuk mendaftarkan Cubit/BLoC global.
      // Serupa dengan Provider, ia membutuhkan BuildContext untuk melacak instansi BLoC.
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => BlocCounterCubit(),
          ),
          BlocProvider(
            create: (_) => AuthCubit(),
          ),
        ],
        child: const AppContent(),
      ),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Template Androzon Flutter',
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
