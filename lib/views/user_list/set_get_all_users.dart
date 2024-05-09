// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../view_models/service/token/TokenProvider.dart';
// import '../../view_models/service/user_service/user_service.dart';
// import '../../view_models/user_model.dart';
// import '../profile/profile_details.dart';
//
// class GetAllUsersScreen extends StatefulWidget {
//   const GetAllUsersScreen({Key? key}) : super(key: key);
//
//   @override
//   _GetAllUsersScreenState createState() => _GetAllUsersScreenState();
// }
//
// class _GetAllUsersScreenState extends State<GetAllUsersScreen> {
//   late UserService userService;
//   List<AppUser> userList = [];
//   File? _image;
//
//   @override
//   void initState() {
//     super.initState();
//
//     final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
//     final token = tokenProvider.getToken();
//
//     userService = UserService(token);
//     _fetchUsers();
//   }
//
//   Future<void> _fetchUsers() async {
//     try {
//       final users = await userService.getAllUsers();
//       setState(() {
//         // userList = users;
//       });
//     } catch (e) {
//       print('Error fetching users: $e');
//     }
//   }
//
//   void _navigateToUserProfile(AppUser user) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) {
//           return ProfileDetailsScreen(user: user);
//         },
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('All Users'),
//       ),
//       body: userList.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: userList.length,
//         itemBuilder: (context, index) {
//           final user = userList[index];
//           return ListTile(
//             title: Text(user.firstName ?? 'Unknown'),
//             subtitle: Text(user.email ?? 'No Email'),
//             onTap: () {
//               _navigateToUserProfile(user);
//             },
//             leading: GestureDetector(
//               onTap: () {
//                 _navigateToUserProfile(user);
//               },
//               child: CircleAvatar(
//                 radius: 30,
//                 backgroundImage: _image != null ? FileImage(_image!) : null,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
