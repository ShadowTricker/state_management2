import 'package:flutter/material.dart';

class StreamBuilderPage extends StatelessWidget {
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
    return StreamBuilder<int>(
      stream: counter(),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        String showData;
        if (snapshot.hasError) showData = snapshot.error;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            showData = '没有Stream';
            break;
          case ConnectionState.waiting:
            showData = '等待数据...';
            break;
          case ConnectionState.active:
            showData = 'active: ${snapshot.data}';
            break;
          case ConnectionState.done:
            showData = 'Stream已关闭';
            break;
        }
        return Center(
          child: Text('$showData')
        );
      },
    );
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }
}
