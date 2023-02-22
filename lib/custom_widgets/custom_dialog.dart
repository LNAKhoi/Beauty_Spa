import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog {
  static Future showAlert(
      {required String title,
      String? content,
      Function? function,
      required BuildContext context}) async {
    return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                title,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xffC93825)),
              ),
              content: Text(
                content!,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff413D3D)),
              ),
              actions: [
                CupertinoDialogAction(
                    child: Text("OK",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xff413D3D))),
                    onPressed: () => Navigator.pop(context))
              ],
            ));
  }
}
