import 'package:flutter/material.dart';

class CircukarCheckBox extends StatelessWidget {
  bool isChecked;

  CircukarCheckBox({
    Key? key,
    this.isChecked = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isChecked) ...[
          Container(
            height: 18,
            width: 18,
            child: Icon(
              Icons.check,
              size: 15,
              color: Colors.black,
            ),
            decoration: BoxDecoration(
                color: Color(0xffEEEEFF),
                border: Border.all(
                  width: 1,
                  color: Color(0xff505AE9),
                ),
                borderRadius: BorderRadius.circular(100)),
          ),
        ],
        if (!isChecked) ...[
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: Color(0xffE7E8EF),
                ),
                borderRadius: BorderRadius.circular(100)),
          ),
        ],
      ],
    );
  }
}
