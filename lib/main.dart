import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_master/features/home/presentaion/pages/home_page.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return ScreenUtilInit(
          splitScreenMode: true,
          builder: (
            _,
            child,
          ) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
              theme: ThemeData(
                colorScheme: lightColorScheme,
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                useMaterial3: true,
              ),
              themeMode: ThemeMode.system,
            );
          },
        );
      },
    );
  }
}
