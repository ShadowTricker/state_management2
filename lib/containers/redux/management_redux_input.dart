import 'package:flutter/material.dart';
import 'package:state_management2/services/http_service.dart';

class ManagementReduxInputPage extends StatefulWidget {

  final String pageType;

  ManagementReduxInputPage({ @required this.pageType });

  @override
  _ManagementReduxInputPageState createState() => _ManagementReduxInputPageState();

}

class _ManagementReduxInputPageState extends State<ManagementReduxInputPage> {

  TextEditingController _itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add ${ widget.pageType }',
        ),
        centerTitle: true,
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          commentInput(),
          buttonArea()
        ],
      ),
    );
  }

  Widget commentInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Form(
        autovalidate: true,
        child: TextFormField(
          controller: _itemController,
          autofocus: false,
          maxLines: 8,
          maxLength: widget.pageType == 'Article' ? 1000 : 100,
          maxLengthEnforced: true,
          decoration: InputDecoration(
            hintText: 'Input your ${ widget.pageType.toLowerCase() }',
          ),
          validator: (v) {
            if (v.trim().isEmpty) {
              return 'Empty';
            }
            return null;
          }
        ),
      )
      
    );
  }

  Widget buttonArea() {
    return Container(
      width: double.infinity,
      height: 52.0,
      child: InkWell(
        child: Center(
          child: Text('Submit', style: TextStyle(
            color: Colors.white,
            fontSize: 20.0
          )),
        ),
        onTap: () async {
          final Map<String, String> newItem = {
            'author': 'shadow-tricker',
            'content': _itemController.text,
            if (widget.pageType == 'Article') 'title': '临时添加',
            if (widget.pageType == 'Comment') 'articleId': '1'
          };
          bool isSuccess = false;
          if (widget.pageType == 'Article') {
            isSuccess = await HttpService.addArticle(newItem);
          }
          else {
            isSuccess = await HttpService.addComment(newItem);
          }
          if(isSuccess) {
            Navigator.of(context).pop();
          } 
          print(newItem);
        },
      ),
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }

}