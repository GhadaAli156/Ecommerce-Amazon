// import 'package:amazon/constants/comman_function.dart';
// import 'package:amazon/constants/constants.dart';
// import 'package:amazon/controller/services/user_data_crud_services/user_data_crud_services.dart';
// import 'package:amazon/model/user_model.dart';
// import 'package:amazon/utils/colors.dart';
// import 'package:flutter/material.dart';
//
// class UserDataInputScreen extends StatefulWidget {
//   const UserDataInputScreen({super.key});
//
//   @override
//   State<UserDataInputScreen> createState() => _UserDataInputScreenState();
// }
//
// class _UserDataInputScreenState extends State<UserDataInputScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       phoneController.text = auth.currentUser!.phoneNumber??'';
//     },);
//   }
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size(width, height*0.08),
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.01),
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors:  appBarGradientColor,begin: Alignment.centerLeft,end: Alignment.centerRight)
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset('assets/images/amazon_black_logo.png',height: height*0.05),
//               ],
//             ),
//           )
//       ),
//       body: Container(
//         width: width,
//         padding: EdgeInsets.symmetric(
//           horizontal: width*0.03,
//           vertical: height*0.02
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Text('Enter your Name',style: textTheme.bodyMedium,),
//             CommanFunction.blankSpace(height*0.01, 0),
//             TextFormField(
//               keyboardType: TextInputType.number,
//               controller: nameController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your Name',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: grey)
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: const BorderSide(color: secondaryColor)
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: grey)
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: grey)
//                 ),
//               ),
//               cursorColor: black,
//             ),
//             CommanFunction.blankSpace(height*0.02, 0),
//             Text('Phone Number',style: textTheme.bodyMedium,),
//             CommanFunction.blankSpace(height*0.01, 0),
//             TextFormField(
//               keyboardType: TextInputType.number,
//               readOnly: true,
//               controller: phoneController,
//               decoration: InputDecoration(
//                 hintText: 'Enter Your Phone Number',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: grey)
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: const BorderSide(color: secondaryColor)
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: grey)
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: grey)
//                 ),
//               ),
//               cursorColor: black,
//             ),
//             const Spacer(),
//             ElevatedButton(
//                 onPressed: ()async{
//                   UserModel userModel = UserModel(
//                     name: nameController.text.trim(),
//                     mobileNum: phoneController.text.trim(),
//                     userType: 'user'
//                   );
//                   await UserDataCRUD.addNewUser(userModel: userModel , context: context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: amber,
//                   minimumSize: Size(width, height*0.06)
//                 ),
//                 child: Text('Proceed',style: textTheme.bodyMedium,))
//           ],
//         ),
//       ),
//     );
//   }
// }
