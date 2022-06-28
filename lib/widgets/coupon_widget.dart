import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({Key? key}) : super(key: key);

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  Color color = Colors.grey;
  bool _enable = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: Column(
              children: [
                      /*Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                                  height: 45,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey[300],
                                        hintText: 'adicionar cupom',
                                        hintStyle: TextStyle(color: Colors.grey)),
                                    textAlign: TextAlign.center,
                                    onChanged: (String value){
                                      if(value.length<3){
                                        setState((){
                                          color=Colors.grey;
                                          _enable = false;
                                        });
                                      if(value.isNotEmpty){
                                        setState((){
                                          color=Theme.of(context).primaryColor;
                                          _enable = true;
                                        });
                                      }
                                      }
                                    },
                                  )
                              )
                          ),
                        ],
                      ),*/
                const SizedBox(height: 10,),
                AbsorbPointer(
                absorbing: _enable ? false : true,
                child: GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                        width: MediaQuery.of(context).size.width-30,
                        color: AppColor.textosPretos2,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Aplicar cupons',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ],
                        )
                    ),
                  ),
                ),),

              ],
            ),
        )
    );
  }
}
