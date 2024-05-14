import 'package:flutter/material.dart';
import 'package:safe_chat/view_models/feeds/feeds_view_model.dart';
import 'package:stacked/stacked.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({super.key});


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FeedsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Feeds'),
            actions: [
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  // Implement your action for messages
                },
              ),
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  // Implement your action for account
                },
              ),
            ],
          ),
          body: Center(
            child: Text('Feeds content will go here.'),
          ),
        );
      },
    );
  }
}
