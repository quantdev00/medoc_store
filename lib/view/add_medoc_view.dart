import 'package:drug_store/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class AddDrugView extends StatefulWidget {
  const AddDrugView({super.key});

  @override
  State<AddDrugView> createState() => _AddDrugViewState();
}

class _AddDrugViewState extends State<AddDrugView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 20),
        child: Column(
          children: [
            appBar,
            const TextField(),
            const TextField(),
            TextButton(onPressed: () {}, child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}
