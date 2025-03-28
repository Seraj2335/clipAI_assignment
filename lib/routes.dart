import 'package:clipwise_ai_assignment/view/QuizScreen.dart';
import 'package:clipwise_ai_assignment/view/home_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const initialPath = '/';

  static const quizPath = "/quiz";
  static const quizScreen = "quiz";

  static GoRouter goRoute() => GoRouter(
      initialLocation: initialPath,
      routes: <RouteBase>[
        GoRoute(path: initialPath, builder: (context, state) => HomeScreen()),
        GoRoute(
            name: quizScreen,
            path: quizPath,
            builder: (context, state) {
              final category = state.extra as String;
              return QuizScreen(category: category);
            }),
      ],
      restorationScopeId: 'app');
}
