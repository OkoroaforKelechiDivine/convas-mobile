// import 'package:flutter/material.dart';
// import 'package:safe_chat/service/user_service/user_service.dart';
// import '../../model/user_model.dart';
// import '../../service/token/TokenProvider.dart';
// import '../chat/set_chat.dart';
//
// class ProfileDetailsScreen extends StatefulWidget {
//   final AppUser user;
//   final TokenProvider tokenProvider;
//
//   const ProfileDetailsScreen({
//     required this.user,
//     required this.tokenProvider,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState(tokenProvider);
// }
// class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
//   bool isFollowing = false;
//
//   final UserService followService;
//   final TokenProvider tokenProvider;
//
//   _ProfileDetailsScreenState(this.tokenProvider)
//       : followService = UserService(tokenProvider.getToken());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: NetworkImage(widget.user.profileImageUrl ?? ''),
//               ),
//               Text('First Name: ${widget.user.firstName ?? 'Unknown'}'),
//               Text('Email: ${widget.user.email ?? 'No Email'}'),
//               SizedBox(height: 20),
//               isFollowing
//                   ? Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         isFollowing = false;
//                       });
//                     },
//                     style: ButtonStyle(
//                       foregroundColor:
//                       MaterialStateProperty.all(Colors.red),
//                     ),
//                     child: Text('Unfollow'),
//                   ),
//                   SizedBox(width: 10),
//                   IconButton(
//                     onPressed: () {
//                       // Navigate to the messaging screen
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               MessagingScreen(user: widget.user),
//                         ),
//                       );
//                     },
//                     icon: Icon(Icons.message),
//                   ),
//                 ],
//               )
//                   : TextButton(
//                 onPressed: () {
//                   followUser();
//                 },
//                 style: ButtonStyle(
//                   backgroundColor:
//                   MaterialStateProperty.all(Colors.blue),
//                 ), child: Text('Follow'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   void followUser() async {
//     try {
//       await followService.followUser(widget.user.id, tokenProvider.userId);
//       setState(() {
//         isFollowing = true;
//       });
//     } catch (e) {
//       print('Error following user: $e');
//     }
//   }
//
// }
