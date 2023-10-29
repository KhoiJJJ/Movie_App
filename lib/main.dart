import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_editor/blocs/bloc_exports.dart';
import 'package:photo_editor/screens/tabs_screen.dart';
import 'package:photo_editor/widgets/app_themes.dart';
import 'package:photo_editor/services/app_router.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   final storage= HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
//   HydratedBloc.runZoned(
//     () => runApp(const MyApp()),
//     storage:storage,
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  BlocOverrides.runZoned(() => runApp(MyApp(appRouter: AppRouter())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Tasks App',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TabsScreen(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
