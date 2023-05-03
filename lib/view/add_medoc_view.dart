import 'package:drug_store/backend/services/firebase_crud.dart';
import 'package:drug_store/view/list_view.dart';
import 'package:flutter/material.dart';

class AddDrugView extends StatefulWidget {
  const AddDrugView({super.key});

  @override
  State<AddDrugView> createState() => _AddDrugViewState();
}

class _AddDrugViewState extends State<AddDrugView> {
  final _drug_name = TextEditingController();
  final _drug_description = TextEditingController();
  final _drug_price = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //*Drug name textfield config
    final drugNameTextField = TextFormField(
      controller: _drug_name,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
    );
    //* Description field right here
    final descriptionTextField = TextFormField(
      controller: _drug_description,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
    );

    //* Field get Price
    final priceTextField = TextFormField(
      controller: _drug_price,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
    );

    //* View list button
    final viewDrugListButton = TextButton(
      onPressed: () {
        // Navigator.of(context).push(MyListView());
        Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(builder: ((context) => MyListView())),
            (route) => false);
      },
      child: const Text('View list drug list'),
    );

    final saveButton = Material(
      elevation: 5.0,
      child: MaterialButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.addDrug(
                name: _drug_name.text,
                description: _drug_description.text,
                price: _drug_price.text);
            if (response.code != 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            }
          }
        },
        child: const Text(
          "Save",
          textAlign: TextAlign.center,
        ),
      ),
    );
    //* end of save button.
    

    return Material(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  drugNameTextField,
                  const SizedBox(height: 25),
                  descriptionTextField,
                  const SizedBox(height: 35),
                  priceTextField,
                  const SizedBox(height: 45),
                  saveButton,
                  const SizedBox(height: 15),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
