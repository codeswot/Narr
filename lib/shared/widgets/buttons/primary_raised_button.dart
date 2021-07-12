import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:narr/shared/themes/colors.dart';

class PrimaryRaisedButton extends StatelessWidget {
  const PrimaryRaisedButton(
      {required this.onTap,
      required this.buttonTitle,
      this.buttonColor = NarrColors.royalGreen});
  final Function(Function, Function, ButtonState) onTap;
  final String buttonTitle;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ArgonButton(
        height: 50,
        width: 350,
        borderRadius: 5.0,
        color: buttonColor,
        child: Text(
          buttonTitle,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        loader: Container(
          padding: EdgeInsets.all(10),
          child: CircularProgressIndicator(
            color: Colors.white,
            // size: loaderWidth ,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}





// ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           width: double.infinity,
//           height: 63,
//           decoration: BoxDecoration(
//             color: buttonColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Center(
//             child: Text(
//               buttonTitle,
//               style: TextStyle(
//                 color: UniNetColors.buttonTextColor,
//                 fontSize: 21,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );