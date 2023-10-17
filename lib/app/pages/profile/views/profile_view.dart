import 'package:flutter/material.dart';
import 'package:base_app/app/bases/base_stateful_widget.dart';
import 'package:base_app/app/pages/profile/viewModels/profile_view_model.dart';

class ProfileView extends BaseStatefulWidget {
  static const routeName = '/profile';

  const ProfileView({Key? key}) : super(key: key);

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends BaseState<ProfileView, ProfileViewModel> {
  @override
  Widget build(BuildContext context) {
    onBuild(provider: profileViewModel);

    return const Scaffold();
  }
}
