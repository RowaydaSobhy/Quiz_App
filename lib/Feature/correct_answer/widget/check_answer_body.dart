import 'package:flutter/cupertino.dart';

import '../../home/data/models/question_model.dart';
import 'check_answer_item_widget.dart';

class CheckAnswerBody extends StatelessWidget {
  const CheckAnswerBody({super.key, required this.questions});
  final List<QuestionModel>  questions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ListView(
        children: [
          ...questions.map((questionModel) =>
              CustomCheckAnswerItemWidget(
                questionModel: questionModel,
              ),
          ),


        ],
      ),
    );
  }
}
