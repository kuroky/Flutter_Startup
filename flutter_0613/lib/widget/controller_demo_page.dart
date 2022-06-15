//import 'dart:html';

import 'package:flutter/material.dart';

class ControllerDemoPage extends StatelessWidget {
  final TextEditingController controller =
      new TextEditingController(text: "init Text");
  //const ControllerDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print("Main MediaQuery padding: ${MediaQuery.of(context).padding} viewInsets.bottom: ${MediaQuery.of(context).viewInsets.bottom}");
    return Scaffold(
      appBar: AppBar(
        title: new Text("ControllerDemoPage"),
      ),
      extendBody: true,
      body: Column(
        children: [
          new Expanded(child: InkWell(onTap: () {
            print('Expanded');
            FocusScope.of(context).requestFocus(FocusNode());
          })),
          CustomWidget(),
          new Container(
            margin: EdgeInsets.all(10),
            child: new Center(
              child: new TextField(
                controller: controller,              
                keyboardAppearance: Brightness.dark,
                onChanged: (text) {
                  print(text);
                },
              ),
            ),
          ),
          new Spacer(),
        ],
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        "Custom MediaQuery padding: ${MediaQuery.of(context).padding} viewInsets.bottom: ${MediaQuery.of(context).viewInsets.bottom}\n \n");
    return Container();
  }
}
