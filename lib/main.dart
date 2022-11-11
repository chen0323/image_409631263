import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageBrowse(title: '409631263 陳丰藝'),
    );
  }
}

class ImageBrowse extends StatefulWidget {
  const ImageBrowse({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ImageBrowse> createState() => _ImageBrowseState();
}

class _ImageBrowseState extends State<ImageBrowse> {
  var images=['assets/1.jpg','assets/2.jpg','assets/3.jpg','assets/4.jpg'];
  int imageindex=1;
  String defult_image="assets/images/1.jpg";

  void previous (){
    if(imageindex<=0){imageindex=4;}
    defult_image = images[imageindex-1];
    imageindex--;
  }
  void next (){
    if(imageindex>=3){imageindex=-1;}
    defult_image = images[imageindex+1];
    imageindex++;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap:(){
                const snackBar = SnackBar(
                  content: Text('                        上帝也瘋狂',
                    textScaleFactor: 1.4,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                height: 400,
                width: 400,
                child: Image.asset(defult_image),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          previous();
                        });
                      },
                      child: Text("上一張",
                        textScaleFactor:1.5,)
                  ),
                  SizedBox(width: 100,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        next();
                      });
                    },
                    child: Text("下一張",
                      textScaleFactor:1.5,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}