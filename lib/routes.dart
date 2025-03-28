import 'package:clipwise_ai_assignment/view/QuizScreen.dart';
import 'package:clipwise_ai_assignment/view/home_screen.dart';
import 'package:go_router/go_router.dart';



class Routes {
  static const initialPath = '/';
  static const initialName = 'quiz';

  static const newsDetailsPath = '/newsDetails';
  static const newsDetails = 'newsDetails';

  static GoRouter goRoute() => GoRouter(
      initialLocation: initialPath,
      routes: <RouteBase>[
        GoRoute(
            name: initialName,
            path: initialPath,
            builder: (context, state) => QuizScreen()),
        // GoRoute(
        //     name: newsDetails,
        //     path: newsDetailsPath,
        //     builder: (context, state) {
        //       final newsId = state.extra as int;
        //       return NewsDetailsClass(newsId: newsId);
        //     }),
      ],
      restorationScopeId: 'app'
  );
}
