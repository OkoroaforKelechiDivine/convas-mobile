import 'package:flutter/material.dart';

import '../../../view_models/create_profile/create_profile_view_model.dart';
import '../../create_account/widget/get_text_field.dart';

class ProfileFormWidget extends StatelessWidget {
  final ProfileScreenViewModel viewModel;

  const ProfileFormWidget({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          getAppTextField(
            labelText: 'Username',
            keyboardType: TextInputType.text,
            controller: TextEditingController(text: viewModel.userName),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => viewModel.selectDate(context),
            child: AbsorbPointer(
              child: getAppTextField(
                labelText: 'Date of Birth',
                keyboardType: TextInputType.datetime,
                controller: TextEditingController(
                  text: viewModel.dateOfBirth != null ? "${viewModel.dateOfBirth!.day}/${viewModel.dateOfBirth!.month}/${viewModel.dateOfBirth!.year}" : "",
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          getAppTextField(
            labelText: 'Bio',
            keyboardType: TextInputType.text,
            controller: TextEditingController(text: viewModel.lastName),
          ),
          const SizedBox(height: 20),
          getAppTextField(
            labelText: 'Hobbies',
            keyboardType: TextInputType.text,
            controller: TextEditingController(text: viewModel.emailAddress),
          ),
        ],
      ),
    );
  }
}
