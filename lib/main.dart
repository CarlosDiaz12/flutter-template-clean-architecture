import 'package:flutter/material.dart';
import 'package:flutter_template_clean_architecture/core/config/injection_container.dart';
import 'package:provider/provider.dart';

import 'core/config/router/routes.gr.dart';
import 'presentation/common/style/app_theme.dart';

void main() async {
  await InjectionContainer.setupProvider();
  runApp(App());
}

class App extends StatelessWidget {
  final _appRouter = AppRouter();
  App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: InjectionContainer.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Flutter Clean Architecture Template',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        //home: ,
      ),
    );
  }
}
