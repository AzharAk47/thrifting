import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Thrifting Apps'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Input'),
                Tab(text: 'List'),
                Tab(text: 'About App'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // Tab 1 content
              InputForm(),

              // Tab 2 content
              MyListView(),

              // Date Picker tab content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Text('Aplikasi ini merupakan aplikasi Thrift yang dibuat oleh Azhar Kurniawan dan Ardi Permana'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class InputForm extends StatelessWidget {
  const InputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nama Barang',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Harga Barang',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Jumlah Barang',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: FilledButton(
            onPressed: () {}, 
            child: const Align(
              alignment: Alignment.center,
              child: Text('Simpan')
              )
            )
          ),
      ],
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
 final List<String> NamaBarang = <String>['Baju', 'Celana', 'Tas'];
 final List<String> Stok = <String>['10', '15', '5'];
 final List<String> Harga = <String>['Rp. 45.000', 'Rp. 60.000', 'Rp. 90.000'];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: NamaBarang.length,
    itemBuilder: (BuildContext context, int index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${NamaBarang[index]} (Stok: ${Stok[index]})'),
          Text(Harga[index]),
          ]
          );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
  }
}
