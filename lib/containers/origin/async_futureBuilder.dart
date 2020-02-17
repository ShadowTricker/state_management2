import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder'),
        centerTitle: true,
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Center(
      child: FutureBuilder<String>(
        future: mockNetworkData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Text("Contents: ${snapshot.data}");
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => '我是异步数据');
  }

}