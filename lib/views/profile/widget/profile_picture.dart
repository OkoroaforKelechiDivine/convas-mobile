import 'dart:async';
import 'package:flutter/material.dart';

import '../../../theme_settings/manager/theme_manager.dart';
import '../../../view_models/create_profile/create_profile_view_model.dart';

class ProfilePictureWidget extends StatefulWidget {
  final String selectedGender;
  final ProfileScreenViewModel viewModel;

  const ProfilePictureWidget({
    Key? key,
    required this.selectedGender,
    required this.viewModel,
  }) : super(key: key);

  @override
  _ProfilePictureWidgetState createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  StreamController<void>? _updateController;

  @override
  void initState() {
    super.initState();
    _updateController = StreamController<void>();
    Timer.periodic(const Duration(seconds: 1), (_) {
      if (_updateController != null && !_updateController!.isClosed) {
        _updateController!.add(null);
      }
    });
  }

  @override
  void dispose() {
    _updateController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMale = widget.selectedGender == 'Male';
    return GestureDetector(
      onTap: () => widget.viewModel.viewImage(context),
      child: Align(
        alignment: Alignment.topCenter,
        child: StreamBuilder<void>(
          stream: _updateController?.stream,
          builder: (context, snapshot) {
            return Stack(
              children: [
                CircleAvatar(
                  key: UniqueKey(),
                  radius: 60,
                  backgroundColor: AppColors.grey,
                  backgroundImage: widget.viewModel.image != null ? FileImage(widget.viewModel.image!) : isMale ? const AssetImage('assets/jpg/male-default-avatar.jpg') : const AssetImage('assets/jpg/female-default-avatar.jpg') as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => widget.viewModel.getImage(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.green,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
