import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/domains/configs/theme/app_theme.dart';
import 'package:flutter_application_1/src/core/presentations/bloc/language/language_cubit.dart';
import 'package:flutter_application_1/src/core/presentations/bloc/theme/theme_cubit.dart';
import 'package:flutter_application_1/src/core/presentations/screens/page_loading.dart';
import 'package:flutter_application_1/src/shared/firebase_options.dart';
import 'package:flutter_application_1/src/shared/getIt.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path),
  );
  HydratedBloc.storage = storage;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // gọi bên hàm getIT để khởi tạo các dependencies
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) => BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, mode) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'MusicApp',
                  theme: ThemeColor.lightTheme,
                  darkTheme: ThemeColor.darkTheme,
                  themeMode: mode,
                  locale: locale,
                  supportedLocales: const [
                    Locale('en'),
                    Locale('vi'),
                  ],
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  home: const LoadingPage(),
                ),
              )),
    );
  }
}
