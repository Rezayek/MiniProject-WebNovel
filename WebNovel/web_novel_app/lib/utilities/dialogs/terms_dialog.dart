import 'package:flutter/material.dart';

import 'generic_dialog.dart';

Future<bool> termsDialog({required BuildContext context}) {
  return showGenericDialog(
      context: context,
      title: 'App using conditions',
      content:["1- Condition 1 +++++++++++Condition+++++++++++++++", 
      "2- Condition 2 +++++++++++Condition+++++++++++++++ +++++++++++Condition+++++++++++++++",
      "3- Condition 3 +++++++++++Condition+++++++++++++++ +++++++++++Condition+++++++++++++++",
      "4- Condition 4 +++++++++++Condition+++++++++++++++ +++++++++++Condition+++++++++++++++",
      ] ,
      optionBuilder: ()=>{'I agree': true, 'Disagre' : false}).then((value) => value ?? false);
}