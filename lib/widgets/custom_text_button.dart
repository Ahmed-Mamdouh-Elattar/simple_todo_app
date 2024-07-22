import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Theme.of(context).cardColor, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              size: 40,
              color: Theme.of(context).cardColor,
            ),
          ],
        ),
      ),
    );
  }
}
