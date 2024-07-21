import 'package:flutter/material.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [Text('Export'), SizedBox(width: 8), Icon(Icons.add, size: 18)],
        ),
      ),
    );
  }
}
