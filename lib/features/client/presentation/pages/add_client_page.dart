import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_master/features/client/data/models/client.model.dart';
import 'package:sales_master/features/client/presentation/viewmodels/allClient.viewmodel.dart';
import 'package:sales_master/helpers/utils.dart';

import 'package:sales_master/shared/widgets/text_field.dart';

class AddClientDialog extends ConsumerStatefulWidget {
  const AddClientDialog({Key? key}) : super(key: key);

  @override
  AddClientDialogState createState() => AddClientDialogState();
}

class AddClientDialogState extends ConsumerState<AddClientDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Center(child: Text('Add Client')),
      content: SingleChildScrollView(
        child: Form(
          key: Utils.formKey,
          child: Column(
            children: <Widget>[
              CustomTextField(
                nameController: nameController,
                labelText: 'Name',
                focusNode: nameFocus,
              ),
              CustomTextField(
                nameController: emailController,
                labelText: 'Email',
                focusNode: emailFocus,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                nameController: phoneController,
                labelText: 'Phone',
                focusNode: phoneFocus,
                keyboardType: TextInputType.phone,
              ),
              CustomTextField(
                nameController: addressController,
                labelText: 'Address',
                focusNode: addressFocus,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            final String name = nameController.text;
            final String email = emailController.text;
            final String phone = phoneController.text;
            final String address = addressController.text;

            if (Utils.formKey.currentState!.validate()) {
              final client = Client()
                ..name = name
                ..email = email
                ..phone = phone
                ..address = address;

              ref
                  .read(allClientViewModelProvider.notifier)
                  .addNewClient(client);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    addressFocus.dispose();
    super.dispose();
  }
}
