import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/locale/app_localizations_setup.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/config/themes/app_theme.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';
import 'features/splash/presentation/cubit/locale_state.dart';
import 'injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LocaleCubit>()..getSavedLang(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            locale: state.locale,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
