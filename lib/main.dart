import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var wtController = TextEditingController();
 var ftController = TextEditingController();
 var inController = TextEditingController();
 var result = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CACLULTOR'),
        ),
         body: Center(
           child: Container(
           width: 300,
           child : Column(
             mainAxisAlignment:MainAxisAlignment.center,
           children: [
            Text('BMI',style: TextStyle(
           fontSize: 34, fontWeight : FontWeight.w700,

        ),),
            SizedBox(height:21,),

            TextField(
              controller:wtController,
              decoration: InputDecoration(
                label: Text('Enter your weights'),
                prefixIcon: Icon(Icons.line_weight),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller:ftController,
              decoration: InputDecoration(
                label: Text('Enter your height'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),

            TextField(
              controller:inController,
              decoration: InputDecoration(
                label: Text('Enter your height(inc)'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
             SizedBox(height: 16,),
             ElevatedButton(onPressed: (){
               var wt = wtController.text.toString();
               var ft = ftController.text.toString();
               var inch = inController.text.toString();

               if(wt!=" "&& ft!=" " && inch!=" "){
                 var iWt = int.parse(wt);
                 var iFt = int.parse(ft);
                 var iInch = int.parse(inch);

                 var tInch = (iFt * 12) + iInch;
                  var tCm = tInch*2.54;
                   var  tM = tCm/100;
                    var bmi = iWt/(tM*tM);
                    setState(() {
                      result = "your BMI  is : ${bmi.toStringAsFixed(2)}";

                    });


               }else{
                 setState(() {
                   result = 'Please fill all the required blanks!!';
                 });
               }
               wtController.clear();
               ftController.clear();
               inController.clear();




             }, child: Text('CALCULATE')),

             Text(result,style: TextStyle(fontSize: 16),),

          ],

        ),
         ),
         ),


    );
  }

}