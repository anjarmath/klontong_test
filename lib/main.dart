import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:klontong_management/di.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_category_bloc.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_bloc.dart';
import 'package:klontong_management/feature/presentation/bloc/klontong_product_list_bloc.dart';
import 'package:klontong_management/feature/presentation/screen/home_screen.dart';
import 'package:klontong_management/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  setupInjection();
  runApp(const MyApp());

  FlutterError.onError = (errorDetail) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetail);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<KlontongProductListBloc>()),
          BlocProvider(create: (_) => sl<KlontongProductBloc>()),
          BlocProvider(create: (_) => sl<KlontongCategoryBloc>())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ));
  }
}
