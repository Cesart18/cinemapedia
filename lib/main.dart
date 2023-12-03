import 'package:flutter/material.dart';
import 'package:cinemapedia/config/routes/app_router.dart';
import 'package:cinemapedia/config/theme/provider/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(child: Cinemapedia()));
}

class Cinemapedia extends ConsumerWidget {
  const Cinemapedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    initializeDateFormatting();

    final appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Cinemapedia',
    );
  }
}
