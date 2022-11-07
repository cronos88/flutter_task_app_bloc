import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_exports.dart';
import 'screens/task_screen.dart';
import 'services/app_router.dart';
import 'services/app_theme.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final storage = await HydratedStorage.build(
//       storageDirectory: await getApplicationDocumentsDirectory());
//   HydratedBlocOverrides.runZoned(
//     () => runApp(
//       MyApp(
//         appRouter: AppRouter(),
//       ),
//     ),
//     storage: storage,
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (context) => TasksBloc(),
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Task App',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TaskScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

// https://www.youtube.com/watch?v=PD0eAXLd5ls&list=PL4KQIoSGkL6uHbPnb1-bcWE07KT9aohQ-&index=9
// QUEDAMOS EN MINUTO 1:13:13