import 'package:flutter/material.dart';
import 'package:gam3a/reuse.dart';
import 'package:sqflite/sqflite.dart';
import '../constants/constants.dart';


class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {


  @override
  initState(){
    super.initState();
    createDatabse();
  }
  late Database database;

  void createDatabse()async{
     database = await openDatabase(
         'ARQA',
         version: 1,
        onCreate: (database, version) async {
           print('databse created');

          await database.execute(
            // 'CREATE TABLE Test (id INTEGER PRIMARY KEY, Title TEXT,Details TEXT,PhoneNumber TEXT,Location TEXT,Bedroom INTEGER,Bathroom INTEGER, Area INTEGER ,Price INTEGER , )');
              //'CREATE TABLE pro (id INTEGER PRIMARY KEY, Img TEXT, Title TEXT, Bedroom INTEGER, Area INTEGER , Price INTEGER)');
              'CREATE TABLE pro (id INTEGER PRIMARY KEY, Img TEXT, Title TEXT, Bedroom INTEGER, Area INTEGER , Price INTEGER)');
        },

        onOpen: (database){
           print('database opened');
           getDataFromDatabase(database).then((value) {
             property=value;
             print(property);
           }
           );


     }

        );
  }

  void insertToDatabase({
    required String image,
    required String title,
    required int bedroom,
    required int area,
    required int price,


}){
    database.transaction((txn) async {

      //await txn.rawInsert('INSERT INTO Proprties (Img, Title, Bedroom ,Area,Price ) VALUES ("$image" , "$title" , "$bedroom","$area","$price")')
      await txn.rawInsert('INSERT INTO pro (Img, Title, Bedroom ,Area,Price ) VALUES ("images/properties/ap1.jpeg" , "AA" , "8","589","77")')
          .then((value) => print('$value inserted succefully'))
          .catchError((e)=> print('error when inserting data: $e'));

    });


  }

Future <List<Map>> getDataFromDatabase(database) async{
    return await database.rawQuery('SELECT * FROM Test');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(onPressed: (){
            insertToDatabase(image: "sadsad", title: "title", bedroom: 8, area: 7, price: 1582);
          }, child: Text('add'),
          ),
          ElevatedButton(onPressed: (){
            print(property);
          }, child: Text('Print'),
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: property.length,
              itemBuilder: (BuildContext context, index) {
                return RecommendCard(property[index]);
              },
            ),
          ),


        ],
        ),
      ),
    );
  }
}
