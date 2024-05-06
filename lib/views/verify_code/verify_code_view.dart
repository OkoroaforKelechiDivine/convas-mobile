import 'package:flutter/material.dart';
import '../../theme_settings/manager/font_manager.dart';
import '../../theme_settings/manager/theme_manager.dart';
import '../../view_models/verifyCode/verify_code_view_model.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({Key? key}) : super(key: key);

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  late VerifyCodeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = VerifyCodeViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            'Verify Code'
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'A verification code has been sent to you',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _viewModel.buildDigitInput(context, 0),
                const SizedBox(width: 20),
                _viewModel.buildDigitInput(context, 1),
                const SizedBox(width: 20),
                _viewModel.buildDigitInput(context, 2),
                const SizedBox(width: 20),
                _viewModel.buildDigitInput(context, 3),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive the code? "),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Retry",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/create_profile');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blackColor
          ),
          child: Text('Send', style: TextStyle(color: AppColors.white)),
        ),
      ),
    );
  }
}
