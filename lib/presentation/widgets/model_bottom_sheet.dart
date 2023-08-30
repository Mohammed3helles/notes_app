import 'package:flutter/material.dart';

class AddNoteModelBottomSheet extends StatelessWidget {
  const AddNoteModelBottomSheet({Key? key}) : super(key: key);
   // TextEditingController  _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        children: [],
      ),
    );
  }
}
