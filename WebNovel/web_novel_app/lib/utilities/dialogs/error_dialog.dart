import 'package:flutter/material.dart';

import 'generic_dialog.dart';

Future<void> errorDialog(
  String tilte,
  BuildContext context,
  String text,
) {
  return showGenericDialog(
    context: context,
    title: tilte,
    content: [text],
    optionBuilder: () => {'OK': null},
  );
}