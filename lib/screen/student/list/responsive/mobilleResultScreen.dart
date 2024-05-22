// import 'package:flutter/material.dart';
//
// import '../../../../main.dart';
// import '../../../../utils/colors.dart';
// import '../../../../utils/text_styles.dart';
// import '../../../../view/widget/student_card_widget.dart';
// import '../../create/view.dart';
//
// class MobileResultScreen extends StatelessWidget {
//   const MobileResultScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorTheme.lightBlue,
//         title: Image.asset(
//           "assets/images/nexteon_image.png",
//           width: size.width * 0.4,
//           height: size.height * 0.4,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
//           child: Expanded(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "New students",
//                 style:
//                     GlTextStyles.interStyl(size: 14, weight: FontWeight.w700),
//               ),
//               ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: students.length + 1,
//                   itemBuilder: (context, index) {
//                     return index == students.length
//                         ? GestureDetector(
//                             onTap: () {
//                               //need to change
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => CreateStudent()));
//                             },
//                             child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 10),
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         width: 1, color: ColorTheme.darkGrey),
//                                     color: ColorTheme.darkGrey.withOpacity(.4),
//                                     borderRadius: BorderRadius.circular(12)),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.add_circle_outline,
//                                       size: size.width * .03,
//                                     ),
//                                     Text(
//                                       "Add New Student",
//                                       style: GlTextStyles.interStyl(
//                                           size: 10, weight: FontWeight.w400),
//                                     )
//                                   ],
//                                 )),
//                           )
//                         : StudentCard(
//                             firstname: students[index].firstname,
//                             lastname: students[index].lastname,
//                             mail: students[index].email,
//                             id: students[index].id,
//                             district: students[index].district,
//                             phone: students[index].phoneNumber,
//                             pincode: students[index].pincode,
//                             country: students[index].country,
//                             fontSize: size.height * 0.010,
//                           );
//                   })
//             ],
//           )),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/contstant/app_constants.dart';
import '../../../../utils/contstant/route_names.dart';
import '../../../../utils/text_styles.dart';
import '../../../../global_widgets/student_card_widget.dart';
import '../../create/view.dart';

class MobileResultScreen extends StatelessWidget {
  const MobileResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New students",
                style:
                    GlTextStyles.interStyl(size: 14, weight: FontWeight.w700),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: students.length + 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: index == students.length
                          ? GestureDetector(
                              onTap: () {
                                //need to change
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => CreateStudent()));
                                GoRouter.of(navigatorKey.currentContext!).goNamed(RoutesName.createStudent);
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: ColorTheme.darkGrey),
                                      color:
                                          ColorTheme.darkGrey.withOpacity(.4),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_circle_outline,
                                        size: size.width * .03,
                                      ),
                                      Text(
                                        "Add New Student",
                                        style: GlTextStyles.interStyl(
                                            size: 10, weight: FontWeight.w400),
                                      )
                                    ],
                                  )),
                            )
                          : StudentCard(
                              firstname: students[index].firstname,
                              lastname: students[index].lastname,
                              mail: students[index].email,
                              id: students[index].id,
                              district: students[index].district,
                              phone: students[index].phoneNumber,
                              pincode: students[index].pincode,
                              country: students[index].country,
                              fontSize: size.height * 0.010,
                            ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
