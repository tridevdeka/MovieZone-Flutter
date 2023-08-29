import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tmdb_movies_flutter/common/constants/languages.dart';
import 'package:tmdb_movies_flutter/common/constants/route_constants.dart';
import 'package:tmdb_movies_flutter/common/screenutil/screenutil.dart';
import 'package:tmdb_movies_flutter/di/get_it.dart';
import 'package:tmdb_movies_flutter/presentation/app_localization.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/language_bloc/language_bloc/language_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_color.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_text.dart';
import 'package:tmdb_movies_flutter/presentation/widgets/wiredash_widget.dart';

import '../journeys/home/home_screen.dart';
import '../routes.dart';
import 'fade_page_route_builder.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc _languageBloc;

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    _languageBloc = getItInstance<LanguageBloc>();
    _languageBloc.add(LoadPreferredLanguageEvent());
    super.initState();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>(
      create: (context) => _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashWidget(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  unselectedWidgetColor: AppColor.royalBlue,
                  colorScheme: Theme.of(context).colorScheme.copyWith(primary: AppColor.royalBlue),
                  primaryColor: AppColor.vulcan,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0, color: AppColor.vulcan),
                ),
                supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                // home: HomeScreen(),
                builder: (context, child) {
                  return child!;
                },
                initialRoute: RouteList.initial,
                onGenerateRoute: (RouteSettings settings) {
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder? widgetBuilder = routes[settings.name];
                  return FadePageRouteBuilder(
                    builder: widgetBuilder!,
                    settings: settings,
                  );
                },
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
