import 'package:flutter/material.dart';
import 'package:gestione_libri_desktop/router.dart';
import 'package:get_it/get_it.dart';
import 'package:model/model.dart';
import 'package:view/city/city_page.dart';
import 'package:view/generated/app_localizations.dart';
import 'package:view/view.dart' as view;
import 'package:view_model/view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _registerSingletons();
  runApp(const MyApp());
}

void _registerSingletons() {
  GetIt getIt = GetIt.instance;
  Model.inject(registerLazySingleton: getIt.registerLazySingleton, inject: getIt.get);
  ViewModel.inject(registerLazySingleton: getIt.registerLazySingleton, inject: getIt.get);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalization.localizationsDelegates,
      supportedLocales: AppLocalization.supportedLocales,
      onGenerateTitle: (context) {
        _registerStringSingletons(context);
        return GetIt.instance.get<AppLocalization>().appName;
      },
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.light),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark),
      ),
      routerConfig: CustomRouter.initialize(
        routeListener: (route) => debugPrint("Route: $route"),
        inject: <T extends Object>({String? instanceName}) => GetIt.instance.get<T>(),
        pushScope: (String name) {
          if (!GetIt.instance.hasScope(name)) {
            GetIt.instance.pushNewScope(
              scopeName: name,
              init: (getIt) {
                ViewModel.scopePushed(
                  scope: name,
                  registerLazySingleton: getIt.registerLazySingleton,
                  inject: getIt.get,
                );
              },
            );
          }
        },
        popScope: (String name) {
          if (GetIt.instance.hasScope(name)) {
            GetIt.instance.dropScope(name);
          }
        },
      ).router,
    );
  }

  void _registerStringSingletons(BuildContext context) {
    GetIt getIt = GetIt.instance;
    getIt.registerSingletonIfAbsent<AppLocalization>(() => AppLocalization.of(context));
    view.View.inject(registerSingletonIfAbsent: getIt.registerSingletonIfAbsent, inject: getIt.get);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: CityPage(GetIt.instance.get),
    );
  }
}
