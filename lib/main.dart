import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:gestione_libri_desktop/router.dart';
import 'package:gestione_libri_desktop/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:model/model.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
    return AdaptiveTheme(
      light: AppTheme.light,
      dark: AppTheme.dark,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 960, name: TABLET),
          const Breakpoint(start: 961, end: double.infinity, name: DESKTOP),
        ],
        child: MaterialApp.router(
          localizationsDelegates: AppLocalization.localizationsDelegates,
          supportedLocales: AppLocalization.supportedLocales,
          onGenerateTitle: (context) {
            _registerStringSingletons(context);
            return GetIt.instance.get<AppLocalization>().appName;
          },
          theme: theme,
          darkTheme: darkTheme,
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
        ),
      ),
    );
  }

  void _registerStringSingletons(BuildContext context) {
    GetIt getIt = GetIt.instance;
    getIt.registerSingletonIfAbsent<AppLocalization>(() => AppLocalization.of(context));
    view.View.inject(registerSingletonIfAbsent: getIt.registerSingletonIfAbsent, inject: getIt.get);
  }
}
