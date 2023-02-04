import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(
  MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  )
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with TickerProviderStateMixin{
  AnimationController? _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  PageView.builder(
           itemCount: 1,
           itemBuilder: (context,index){
         return Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               height: 300.0,
               child: GestureDetector(
                 onTap: (){
                   _animationController?.forward();

                 },
                 child: Lottie.asset('animations/${index + 1}.json',
                 height: 300,
                   repeat: true,
                 ),
               ),
             ),
             SizedBox(height: 30),
             ElevatedButton(onPressed: (){
               _animationController?.reverse();
             }, child: Text("Start")),
           ],
         );
       }),
    );
  }
}
