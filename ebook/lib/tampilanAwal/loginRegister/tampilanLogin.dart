import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutterapp/admin/loginAdmin.dart';
import 'package:myflutterapp/home/beranda.dart';

import 'package:myflutterapp/home/home.dart';

class TampilanAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(8),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: GoogleFonts.bangers(
                        fontSize: 30,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text('Verifikasi identitas otomatis yang memungkinkan Anda memverifikasi identitas Anda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                      ),
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/splashScreen/splashScreen.jpg')),
                  ),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()));
                  },
                  color: Colors.blueAccent[400],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()));
                  },
                  color: Colors.greenAccent[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPrefences())
                    );
                  },
                  color: Colors.greenAccent[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Login sebagai admin",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/img/background/backgroundLogin.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.dstATop))),
        ),
      ),
    );

    // return DecoratedBox(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //         image: AssetImage("assets/img/background/backgroundLogin.jpg"),
    //       fit: BoxFit.cover,
    //     )
    //   ),
    //   child: Center(
    //     // width: double.infinity,
    //     // height: MediaQuery.of(context).size.height,
    //     // padding: EdgeInsets.symmetric(
    //     //   horizontal: 30,
    //     //   vertical: 30
    //     // ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Text(
    //               "Hello There!",
    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
    //             ),
    //             SizedBox(height: 30,),
    //             Text(
    //               "Automatic identity verification which enable you to verify your identity",
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   color: Colors.grey[700],
    //                   fontSize: 15
    //               ),
    //             ),
    //           ],
    //         ),
    //         Container(
    //           height: MediaQuery.of(context).size.height/4,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(image: AssetImage('assets/splashScreen/splashScreen.jpg'))
    //           ),
    //         ),
    //         MaterialButton(
    //           minWidth: double.infinity,
    //           height: 60,
    //           onPressed: (){
    //             Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => Home())
    //             );
    //           },
    //           color: Colors.blueAccent[400],
    //           shape: RoundedRectangleBorder(
    //               side: BorderSide(
    //                   color: Colors.black
    //               ),
    //               borderRadius: BorderRadius.circular(40)
    //           ),
    //           child: Text("Login",
    //             style: TextStyle(
    //                 fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white
    //             ),
    //           ),
    //         ),
    //
    //         MaterialButton(
    //           minWidth: double.infinity,
    //           height: 60,
    //           onPressed: (){
    //             Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => Home())
    //             );
    //           },
    //           color: Colors.greenAccent[400],
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(40)
    //           ),
    //           child: Text("Sign Up",
    //             style: TextStyle(
    //                 fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white
    //             ),
    //           ),
    //         ),
    //
    //         MaterialButton(
    //           minWidth: double.infinity,
    //           height: 60,
    //           onPressed: (){
    //             Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => LoginPrefences())
    //             );
    //           },
    //           color: Colors.greenAccent[400],
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(40)
    //           ),
    //           child: Text("Login sebagai admin",
    //             style: TextStyle(
    //                 fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white
    //             ),
    //           ),
    //         ),
    //
    //
    //       ],
    //     ),
    //   ),
    // );

    // return Scaffold(
    //   body: Container(
    //     child: Stack(
    //       children: [
    //         Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5iTbSxCbyqIh6MZXBtO-rorwMIE-GcxnWhw&usqp=CAU'),
    //         Container(
    //           width: double.infinity,
    //           color: Color.fromARGB(100, 22, 44, 33),
    //           margin: EdgeInsets.all(20),
    //           padding: EdgeInsets.all(40),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     "Hello There!",
    //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
    //                   ),
    //                   SizedBox(height: 30,),
    //                   Text(
    //                     "Automatic identity verification which enable you to verify your identity",
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                         color: Colors.black,
    //                         fontSize: 15
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Container(
    //                 height: MediaQuery.of(context).size.height/4,
    //                 decoration: BoxDecoration(
    //                     image: DecorationImage(image: AssetImage('assets/splashScreen/splashScreen.jpg'))
    //                 ),
    //               ),
    //               MaterialButton(
    //                 minWidth: double.infinity,
    //                 height: 60,
    //                 onPressed: (){
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) => Home())
    //                   );
    //                 },
    //                 color: Colors.blueAccent[400],
    //                 shape: RoundedRectangleBorder(
    //                     side: BorderSide(
    //                         color: Colors.black
    //                     ),
    //                     borderRadius: BorderRadius.circular(40)
    //                 ),
    //                 child: Text("Login",
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white
    //                   ),
    //                 ),
    //               ),
    //
    //               MaterialButton(
    //                 minWidth: double.infinity,
    //                 height: 60,
    //                 onPressed: (){
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) => Home())
    //                   );
    //                 },
    //                 color: Colors.greenAccent[400],
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(40)
    //                 ),
    //                 child: Text("Sign Up",
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white
    //                   ),
    //                 ),
    //               ),
    //
    //               MaterialButton(
    //                 minWidth: double.infinity,
    //                 height: 60,
    //                 onPressed: (){
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) => LoginPrefences())
    //                   );
    //                 },
    //                 color: Colors.greenAccent[400],
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(40)
    //                 ),
    //                 child: Text("Login sebagai admin",
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white
    //                   ),
    //                 ),
    //               ),
    //
    //
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
