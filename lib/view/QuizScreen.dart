import 'package:clipwise_ai_assignment/model/models/groq_response_model.dart';
import 'package:clipwise_ai_assignment/model/models/quiz_list_model.dart';
import 'package:clipwise_ai_assignment/view/widgets/decorated_container.dart';
import 'package:clipwise_ai_assignment/view/widgets/shimmer_list.dart';
import 'package:clipwise_ai_assignment/view_model/quiz_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/apis/api_reponse.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<QuizProvider>(context, listen: false);
    provider.fetchQuizList(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<QuizProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Color(0xff212426),
        body: Consumer<QuizProvider>(builder: (context, provider, widget) {
          if (provider.response.status == Status.INITIAL) {
            return SafeArea(
                child: Center(
                    child: CircularProgressIndicator(
              color: Colors.white,
            )));
          } else if (provider.response.status == Status.ERROR) {
            return Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            final quizList = provider.response.data! as List<QuizList>;
            return SafeArea(
                child: PageView.builder(
                    itemCount: quizList.length,
                    itemBuilder: (context, index) {
                      List<String> options = quizList[index].options!;
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: size.height * .05),
                            child: Text(
                              "Question ${index + 1}/${quizList.length}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(size.width * .04,
                                size.height * .05, size.width * .04, 0),
                            child: Column(
                              children: [
                                DecoratedContainer(
                                  text: quizList[index].question!,
                                  size: size,
                                  secondColor: Color(0xff000000),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                for (int i = 0; i < options.length; i++)
                                  DecoratedContainer(
                                    text: options[i],
                                    indexO: i,
                                    indexQ: index,
                                    provider: provider,
                                    answer: quizList[index].answer,
                                    size: size,
                                    alignment: Alignment.topLeft,
                                  ),
                                SizedBox(
                                  height: size.height * .03,
                                ),
                                DecoratedContainer(
                                  size: size,
                                  text: '<<<<< Swipe >>>>>',
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }));
          }
        }));
  }
}
