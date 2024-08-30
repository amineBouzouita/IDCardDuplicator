import 'package:flutter/material.dart';
import 'package:todo/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  //List of Todo Tiles
  List toDoList= [
    ["what to do ?",false],
    ["mAKE TUTO ",true],
  ]; 
  // method for detecting checkbox tap
   void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1]= !toDoList[index][1] ;
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("To DO"),
        //if we remove the elevation there a little shadow that will apear bneth the appbar
        elevation: 0,
      ),

      //Instead of using a List View whch will only hold the hard coded widget later on i want to eb able to
      // add components(ToDO Tiles) dynamically iwht buttons thats why we use ListView.builder
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
          taskName: toDoList[index][0], 
          taskCompleted: toDoList[index][1], 
          onChanged: (p0) => checkBoxChanged,);
          

        },
       
      ),
    );
  }
}
