import 'package:flutter/material.dart';

class SharedDataWidget extends InheritedWidget {

  SharedDataWidget({ 
    @required this.data,
    @required this.action,
    Widget child
  }): super(child: child);

  final int data;

  final action;

  static SharedDataWidget of(BuildContext context) {
    /// return context.inheritFromWidgetOfExactType(targetType)
    /// inheritFromWidgetOfExactType(targetType) => dependOnInheritedWidgetOfExactType()
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(SharedDataWidget old) {
    /// 如果返回true，则子树中依赖(build函数中有调用)本widget
    /// 的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }

}