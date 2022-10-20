import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class VerificationBottomSheet extends StatelessWidget {
  const VerificationBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                // ignore: prefer_const_constructors
                Text(
                  'Select an image from',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.blue.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(0);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(Icons.camera),
                    // ignore: prefer_const_constructors
                    Text(
                      'Camera',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(1);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(
                      Icons.browse_gallery,
                      color: Colors.black,
                    ),
                    Text(
                      'Gallery',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
