// import 'package:flutter/material.dart';
// import 'package:ppkd_b_3/tugas_15flutter/models/get_user_model.dart';

// class ProfileCard extends StatelessWidget {
//   final GetUserModel data;
//   final VoidCallback onEdit;

//   const ProfileCard({
//     super.key,
//     required this.data,
//     required this.onEdit,

//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       margin: EdgeInsets.only(bottom: 20),
//       child: Container(
//         height: 160,
//         width: double.infinity,
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   data.,
//                   style: TextStyle(
//                     fontFamily: "Montserrat",
//                     fontSize: 16,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: onEdit,
//                       icon: Icon(Icons.edit, color: Colors.white),
//                     ),
//                     IconButton(
//                       onPressed: onDelete,
//                       icon: Icon(Icons.delete, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Text(
//               data.categories,
//               style: TextStyle(
//                 fontFamily: "Montserrat",
//                 fontSize: 16,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               data.stage,
//               style: TextStyle(
//                 fontFamily: "Montserrat",
//                 fontSize: 16,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
