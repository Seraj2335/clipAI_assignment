import 'package:clipwise_ai_assignment/model/models/groq_response_model.dart';
import 'package:clipwise_ai_assignment/model/models/quiz_list_model.dart';
import 'package:clipwise_ai_assignment/view/widgets/shimmer_list.dart';
import 'package:clipwise_ai_assignment/view_model/quiz_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/apis/api_reponse.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<QuizProvider>(context, listen: false);
    provider.fetchQuizList('cricket');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<QuizProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Color(0xff212426),
        body: Consumer<QuizProvider>(builder: (context, provider, widget) {
          if (provider.response.status == Status.INITIAL) {
            return ShimmerLoadingList();
          } else if (provider.response.status == Status.ERROR) {
            return Center(
              child: Text('Something went wrong'),
            );
          } else {
            final quizList = provider.response.data! as List<QuizList>;
            return SafeArea(
                child: PageView.builder(
                    itemCount: quizList.length,
                    itemBuilder: (context, index) {
                      List<String> options = quizList[index].options!;
                      return Container(
                        margin: EdgeInsets.fromLTRB(size.width * .04,
                            size.height * .05, size.width * .04, 0),
                        child: Column(
                          children: [
                            Text(
                              quizList[index].question!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: size.height*.02,),
                            for (int i = 0;
                                i < quizList[0].options!.length;
                                i++)
                              Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(),
                                child: Text(
                                  options[i],
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                          ],
                        ),
                      );
                    }));
          }
        }));
  }
}
