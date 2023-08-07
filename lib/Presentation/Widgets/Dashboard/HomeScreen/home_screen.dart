import 'package:flutter/material.dart';
import 'package:hbk/Presentation/Common/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
   HomeScreen(this.scaffoldKey, {super.key});

  @override
  Widget build(BuildContext context) {

    return   Scaffold(

      //  drawer: Drawer(),

        appBar: CustomAppBar(onBackTap: (){
          scaffoldKey.currentState!.openDrawer();

        },),
        body: const Center(child: Text("HomeScreen")));
  }
}
