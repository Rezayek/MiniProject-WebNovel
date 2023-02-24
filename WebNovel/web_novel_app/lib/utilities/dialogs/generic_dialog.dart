import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

import 'package:web_novel_app/widgets/auth_widgets/dialog_button.dart';

typedef DialogOptions<T> = Map<String, T?> Function();
typedef DialogContent<String> = List<String>;
Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required DialogOptions optionBuilder,
  required DialogContent content,
}) {
  final option = optionBuilder();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: white,
        title: Container(
          height: MediaQuery.of(context).size.height *0.05,
          decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            gradient: LinearGradient(colors: [lightBlue.withOpacity(0.5), lightPurple.withOpacity(0.5)], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Center(
            child: Text(
                    title,
                    style: const TextStyle(
              color: black, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 5 , bottom: 5, left: 5),
        content: content.length > 1? SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: ListView.builder(
              itemCount: content.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    content[index],
                    style: const TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                );
              },
            ),
          ),
        ): 
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
            child: Text(
                content[0],
                style: const TextStyle(
                color: black,
                fontSize: 18,
                fontWeight: FontWeight.w500),),
          ),
        ),
        actionsPadding: const EdgeInsets.all(5),
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: option.keys.map((optionTitle) {
                final T value = option[optionTitle];
                return TextButton(
                    onPressed: () {
                      if (value != null) {
                        Navigator.of(context).pop(value);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: DialogButton(buttonText: optionTitle));
              }).toList(),
            ),
          )
        ],
      );
    },
  );
}
