import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/ui/utils/string_constants.dart';

Future<void> showAlertDialog({
  required BuildContext context,
  required String title,
  String? contentText,
}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: contentText == null
            ? const SizedBox()
            : SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(contentText),
                  ],
                ),
              ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(StringConstants.ok.toUpperCase()),
          ),
        ],
      );
    },
  );
}
