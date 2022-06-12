
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors.dart';


class DatePickerField extends StatelessWidget {
  final String? level;
  final VoidCallback ? onTap;
  final String? hintText;

  const DatePickerField({
    Key? key,
    this.level,
    this.onTap,
    this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$level",
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColor.textosPretos2
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: onTap,

            child: IgnorePointer(
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: GoogleFonts.poppins(color: AppColor.textosPretos2,fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),


                    ),
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.grey.withOpacity(0.4),)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}