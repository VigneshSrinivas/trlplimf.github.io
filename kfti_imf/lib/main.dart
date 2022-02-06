import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlutoGrid Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlutoGridExamplePage(),
    );
  }
}

class PlutoGridExamplePage extends StatefulWidget {
  const PlutoGridExamplePage({Key? key}) : super(key: key);

  @override
  State<PlutoGridExamplePage> createState() => _PlutoGridExamplePageState();
}

class _PlutoGridExamplePageState extends State<PlutoGridExamplePage> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
        title: 'No',
        field: 'No',
        type: PlutoColumnType.text(),
        width: 60.0
    ),
    PlutoColumn(
        title: 'Char',
        field: 'Char',
        type: PlutoColumnType.text(),
        width: 90.0
    ),
    PlutoColumn(
        title: 'Check',
        field: 'Check',
        type: PlutoColumnType.text(),
        width: 90.0
    ),
    PlutoColumn(
        title: 'Standard',
        field: 'Standard',
        type: PlutoColumnType.text(),
        width: 140.0
    ),
    PlutoColumn(
        title: 'UOM',
        field: 'UOM',
        type: PlutoColumnType.text(),
        width: 60.0
    ),
  ];


  final List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'No': PlutoCell(value: '1'),
        'Char': PlutoCell(value: 'Apperance'),
        'Check': PlutoCell(value: 'Visual'),
        'Standard': PlutoCell(value: 'Free from flash & short fill'),
        'UOM': PlutoCell(value: 'gms'),

      },
    ),
  ];

  BsSelectBoxController _select1 = BsSelectBoxController();
  BsSelectBoxController _select2 = BsSelectBoxController();

  bool createclick = false;

  /// columnGroups that can group columns can be omitted.
  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(title: 'NO', fields: ['No'], expandedColumn: true),
    PlutoColumnGroup(title: 'Char', fields: ['Char'], expandedColumn: true),
    PlutoColumnGroup(title: 'Check', fields: ['Check'], expandedColumn: true),
    PlutoColumnGroup(title: 'Standard', fields: ['Standard'], expandedColumn: true),
    PlutoColumnGroup(title: 'UOM', fields: ['UOM'], expandedColumn: true),
  ];

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KFTI'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text('IMF Inspection Entry',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.blue),),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                children: [
                  TableRow( children: [
                    Column(children:[Text('Report No:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Report Date:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),

                  ]),
                  TableRow( children: [
                    Column(children:[Container(height: 50.0,width: 350.0,child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),)]),
                    Column(children:[Container(height: 50.0,width: 350.0,child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),)]),

                  ]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                children: [
                  TableRow( children: [
                    Column(children:[Text('Prod Line:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Stage:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Work Order No:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),

                  ]),
                  TableRow( children: [
                    Column(children:[Container(width: 240.0,child: BsSelectBox(
                      hintText: 'Select',
                      controller: _select2,
                    ),)]),
                    Column(children:[Container(width: 240.0,child: BsSelectBox(
                      hintText: 'Select',
                      controller: _select2,
                    ),)]),
                    Column(children:[Container(width: 240.0,child: BsSelectBox(
                      hintText: 'Select',
                      controller: _select2,
                    ),)]),
                  ]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                children: [
                  TableRow( children: [
                    Column(children:[Text('Part No:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Part Name:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Model:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                  ]),
                  TableRow( children: [

                    Column(children:[Container(height: 50.0,width: 240.0,child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),)]),
                    Column(children:[Container(height: 50.0,width: 240.0,child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),)]),
                    Column(children:[Container(height: 50.0,width: 240.0,child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),)]),
                  ]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                children: [
                  TableRow( children: [
                    Column(children:[Text('Grade:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Machine:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Vernier Caliper No:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),

                  ]),
                  TableRow( children: [
                    Column(children:[Container(width: 240.0,child: BsSelectBox(
                      hintText: 'Select',
                      controller: _select2,
                    ),)]),
                    Column(children:[Container(width: 240.0,child: BsSelectBox(
                      hintText: 'Select',
                      controller: _select2,
                    ),)]),
                    Column(children:[Container(width: 240.0,child: BsSelectBox(
                      hintText: 'Select',
                      controller: _select2,
                    ),)]),
                  ]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Shift:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
                    Container(width: 240.0,child: BsSelectBox(
                      hintText: 'Select',
                      controller: _select2,
                    )
                    ),
                  ],
                ),
                  SizedBox(width: 10.0,),
                  Container(width: 500,child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration.collapsed(hintText: "Rejection Details",border: OutlineInputBorder()),
                  ),)
                ],
              )
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                children: [
                  TableRow( children: [
                    Column(children:[Text('Lot No:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Image:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                  ]),
                  TableRow( children: [
                    Column(children:[Container(
                        child: Container(child: Text('Lotno',style: TextStyle(fontSize: 18.0),),)
                    )]),
                    Column(children:[Container(
                        child: Container(child: Text('Image',style: TextStyle(fontSize: 18.0),),)
                    )]),
                  ]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                children: [
                  TableRow( children: [
                    Column(children:[Text('Prepared By:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Checked By:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                    Column(children:[Text('Approved By:', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))]),
                  ]),
                  TableRow( children: [
                    Column(children:[Container(height: 50.0,width: 240.0,child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),)]),
                    Column(children:[Container(height: 50.0,width: 240.0,child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),)]),
                    Column(children:[Container(height: 50.0,width: 240.0,child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),)]),
                  ]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                children: [
                  TableRow( children: [
                    Column(children:[FlatButton(onPressed: (){
                      setState(() {
                        createclick = true;
                      });
                    }, child: Text('Create'),color: Colors.green,textColor: Colors.white,)]),
                    Column(children:[FlatButton(onPressed: (){}, child: Text('First'),color: Colors.blue,textColor: Colors.white,)]),
                    Column(children:[FlatButton(onPressed: (){}, child: Text('Middle'),color: Colors.blue,textColor: Colors.white,)]),
                    Column(children:[FlatButton(onPressed: (){}, child: Text('Last'),color: Colors.blue,textColor: Colors.white,)]),
                    Column(children:[FlatButton(onPressed: (){}, child: Text('Clear'),color: Colors.red,textColor: Colors.white,)]),
                  ]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: 476,
                  padding: const EdgeInsets.all(15),
                  child:
                  PlutoGrid(
                    columns: columns,
                    rows: rows,
                    columnGroups: columnGroups,
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      stateManager = event.stateManager;
                    },
                    onChanged: (value) {

                    },
                    configuration: const PlutoGridConfiguration(
                      enableColumnBorder: true,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}