import 'package:clipwise_ai_assignment/model/models/category_model.dart';
import 'package:clipwise_ai_assignment/view/QuizScreen.dart';
import 'package:clipwise_ai_assignment/view/widgets/decorated_container.dart';
import 'package:clipwise_ai_assignment/view_model/quiz_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/apis/api_reponse.dart';
import '../routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
  List<String> category3 = ["Sports", "Technology", "Business"];

  // @override
  // void initState() {
  //   final provider = Provider.of<QuizProvider>(context, listen: false);
  //   provider.fetchQuizCategory(
  //       "Create a list of one word string data for quiz category in json data like ${{
  //     'category': ["", "", ""]
  //   }}");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xff212426),
        body:
            // Consumer<QuizProvider>(builder: (context, provider, widget) {
            // if (provider.response1.status == Status.INITIAL) {
            //   return Center(
            //       child: CircularProgressIndicator(
            //     color: Colors.white,
            //   ));
            // } else if (provider.response1.status == Status.ERROR) {
            //   return Center(
            //     child: Text(
            //       'Something went wrong',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   );
            // } else {
            //   List<String> categoryList = provider.response1.data as List<String>;

            Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .02, vertical: size.height * .1),
          child: Column(
            children: [
              Text(
                'Please select the category to generate quiz',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: size.height * .05,
              ),

              Row(
                  children: List.generate(
                      category3.length,
                      (index) => GestureDetector(
                          onTap: () => context.push(Routes.quizPath,
                              extra: category3[index]),
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * .03),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Text(
                                category3[index],
                                style: TextStyle(color: Colors.white),
                              ))))),

              // GestureDetector(
              //     onTap: () {
              //       if (provider.category != null &&
              //           provider.category!.isNotEmpty) {
              //         context.push(Routes.quizPath,
              //             extra: provider.category);
              //       }
              //     },
              //     child: DecoratedContainer(text: 'Submit', size: size))
            ],
          ),
        ));
    // return Scaffold(
    //   backgroundColor: Color(0xff212426),
    //   body: SafeArea(
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(
    //             horizontal: size.width * .03, vertical: size.height * .05),
    //         child: Column(
    //           children: [
    //             Container(
    //                 padding: EdgeInsets.symmetric(
    //                     horizontal: size.width * .04,
    //                     vertical: size.height * .01),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.all(Radius.circular(25))),
    //                 child: Text(
    //                   'Please select the category to generate quiz',
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 24,
    //                       fontWeight: FontWeight.w700),
    //                 )),
    //             SizedBox(
    //               height: size.height * .03,
    //             ),
    //             Expanded(
    //               child:
    //               Consumer<QuizProvider>(builder: (context, provider, widget) {
    //                 if (provider.response1.status == Status.INITIAL) {
    //                   return SafeArea(
    //                       child: Center(
    //                           child: CircularProgressIndicator(
    //                             color: Colors.white,
    //                           )));
    //                 } else if (provider.response1.status == Status.ERROR) {
    //                   return Center(
    //                     child: Text(
    //                       'Something went wrong',
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                   );
    //                 } else {
    //                   final categoryList = provider.response1.data as List<
    //                       String>;
    //                   return  ;
    // return GridView.builder(
    //     itemCount: categoryList.length,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 3, crossAxisSpacing: 5),
    //     itemBuilder: (context, index) {
    //       return GestureDetector(
    //         onTap: () => Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => QuizScreen(
    //                     category: categoryList[index]))),
    //         child: DecoratedContainer(
    //             text: categoryList[index], size: size),
    //                 //       );
    //                 //     });
    //               }
    //               }),
    //             )
    //             // GridView(gridDelegate: gridDelegate)
    //           ],
    //         ),
    //       )),
    // );
  }
}
