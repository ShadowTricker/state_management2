# Flutter State Management Base  

## 1. State & Props （状态 & 属性）  
什么是 Props？  
`Props` 是由 `父组件` 传递给 `子组件` 的 **变量或者数据（甚至是函数，方法）**，它在子组件构造函数执行初始化时被初始化，初始化后 `不能被修改`。

什么是 State？  
`State` 是由组件 **自身管理的变量或者数据**， 当 State 变化时（`通过 setState()`）， UI 的构建器将会自动的重新渲染对应的 `UI树`。组件自身的State是可变的，而且可以作为变量或者数据传递给子组件。

Flutter 根据这两种概念 提供了两种 Widget：  
- StatelessWidget
> 不含有状态（`State`）的组件（`无生命周期`），内部变量在组件被创建时就已经固定，或者由父级传入变量在构造器函数运行时初始化。
- StatefulWidget
> 含有状态的组件， 组件拥有自己的状态（`State`）, 可以通过 `生命周期` 或者 函数（`setState()`） 来更新自身的状态变量， 从而更新 `UI树`。

下面的两段代码分别是 `有状态组件` 和 `无状态组件` 的实现：  
```dart
/// 无状态组件

class WithoutStateWidget extends StatelessWidget {

  final int count;

  WithoutStateWidget(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Widget Without State',
            style: TextStyle(
              fontSize: 24.0
            ),
          ),
          Expanded(
            child: Center(
              child:  Text(
                'count: $count',
                style: TextStyle(
                  fontSize: 24.0
                )
              ),
            ),
          )
        ],
      ),
    );
  }

}
```

```dart
/// 有状态组件
class WithStateWidget extends StatefulWidget {

  final getCount;

  WithStateWidget({ this.getCount });

  @override
  _WithStateWidgetState createState() => _WithStateWidgetState();

}

class _WithStateWidgetState extends State<WithStateWidget> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget With State',
            style: TextStyle(
              fontSize: 24.0
            )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      count++;
                      if (widget.getCount != null) {
                        widget.getCount(count);
                      }
                    });
                  } 
                ),
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.remove,
                  onPressed: () {
                    setState(() {
                      count--;
                      if (widget.getCount != null) {
                        widget.getCount(count);
                      }
                    });
                  } 
                ),
                Text(
                  'count: $count',
                  style: TextStyle(
                    fontSize: 24.0
                  )
                )
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
    );
  }

  Widget _buildButton({ Color buttonColor, Color fontColor, icon, onPressed }) {
    return Ink(
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: fontColor,
      ),
      decoration: ShapeDecoration(
        color: Colors.lightBlue,
        shape: CircleBorder(),
      ),
    );
  }

}

```

相对比而言，有状态组件的实现相对麻烦。
1. 首先，要实现一个 `有状态组件的类`， 然后在这个类中进行组件的初始化工作（如构造函数的初始化）。
2. 其次，要在组件内部通过 `createState()` 实例化该组件的状态类。  
3. 实现一个该组件的 `状态类`，包括渲染 `UI树` 的方法。
4. `state` 通过 `widget.xxxx` 的方式调用组件类中的属性和方法。

---

## 2. Downward Data Flow （单向数据流）  
单向数据流指的是数据在 Flutter App 中的流动方向， 它总是从上到下流动的，即数据总是通过 父组件 流动到 子组件， 如果想要数据的反向流动， 一般方式是做不到的，需要通过特殊的方法（比如通过传递回调函数的方式）。  
下面是一个单向数据流的小 Demo：  
```dart
/// router pass a text to demo page
Map<String, WidgetBuilder> router(context) {
  return {
    // ...other code
    '/origin/2': (context) => DownwardDataPage(
      text: ModalRoute.of(context).settings.arguments
    ),
    // ...other code
  };
}

/// page get the text and initialized,
/// and let the text down to their sub widget
class DownwardDataPage extends StatelessWidget {

  final String text;

  DownwardDataPage({ @required this.text });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downward Data Flow'),
        centerTitle: true,
      ),
      body: _buildPageContainer(text + '1')
    );
  }

  Widget _buildPageContainer(String displayText) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Page: $displayText',
            style: TextStyle(
              fontSize: 16.0
            )
          ),
          _buildOuterContainer(displayText + '2')
        ],
      )
    );
  }

  Widget _buildOuterContainer(String displayText) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Outer: $displayText',
            style: TextStyle(
              fontSize: 16.0
            )
          ),
          _buildInnerContainer(displayText + '3')
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black26
        )
      ),
    );
  }

  Widget _buildInnerContainer(String displayText) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Inner: $displayText',
            style: TextStyle(
              fontSize: 16.0
            )
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black26
        )
      ),
    );
  }
}
```

可以看到 父组件 通过 子组件 的构造函数将数据传递给子组件，也就是 `props`，然后子组件通过 `props` 渲染 UI。  

---

## 3. State Improvement （状态提升）  

状态提升指， 如果 `相邻或者同级别的组件` 之间需要 `共享状态`，鉴于单向数据流动的原因，只能将共享的状态或者数据交给此相邻组件的 `共同的父组件` 保管。  
例如下图：  
![state_improvement1](./assets/md_images/state_improvement1.png)  
其中 list2 假如也需要用到 comments 这个状态（数据），为了使comments 共享， 改成如下的形式：
![state_improvement2](./assets/md_images/state_improvement2.png)
将 `comments` 的状态提升至 list1和list2 共同的父组件 `commentsApp` 中， 然后将其作为 `props` 传递至 两个 list中。comments 作为 commentsApp 的 `state`， 当 comments 更新时，渲染在 app 中的 两个 list 组件会因为 app 的更新而更新（props 也会更新）。  

下面是 Demo：
```dart 
/// the super widget with two sub widget
/// one is stateful and another is stateless
/// create a function that can change super widget's state
class StateImprovementPage extends StatefulWidget {

  @override
  _StateImprovementPageState createState() => _StateImprovementPageState();

}

class _StateImprovementPageState extends State<StateImprovementPage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Improvement'),
        centerTitle: true,
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'SuperCount: $count',
            style: TextStyle(
              fontSize: 16.0
            ),
          ),
          WithStateWidget(getCount: getCount),
          WithoutStateWidget(count)
        ],
      ),
    );
  }

  void getCount(int count) {
    setState(() {
      this.count = count;
    });
  }

}

/// the widget without state
/// initialized use the props which the super widget passed in
class WithoutStateWidget extends StatelessWidget {

  final int count;

  WithoutStateWidget(this.count);

  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Widget Without State',
            style: TextStyle(
              fontSize: 24.0
            ),
          ),
          Expanded(
            child: Center(
              child:  Text(
                'count: $count',
                style: TextStyle(
                  fontSize: 24.0
                )
              ),
            ),
          )
        ],
      ),
    );
  }

} 

/// widget with state
/// a function which passed by super widget
/// to change the state of super widget
class WithStateWidget extends StatefulWidget {

  final getCount;

  WithStateWidget({ this.getCount });

  @override
  _WithStateWidgetState createState() => _WithStateWidgetState();

}

class _WithStateWidgetState extends State<WithStateWidget> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget With State',
            style: TextStyle(
              fontSize: 24.0
            )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      count++;
                      if (widget.getCount != null) {
                        widget.getCount(count);
                      }
                    });
                  } 
                ),
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.remove,
                  onPressed: () {
                    setState(() {
                      count--;
                      if (widget.getCount != null) {
                        widget.getCount(count);
                      }
                    });
                  } 
                ),
                Text(
                  'count: $count',
                  style: TextStyle(
                    fontSize: 24.0
                  )
                )
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
    );
  }

  Widget _buildButton({ Color buttonColor, Color fontColor, icon, onPressed }) {
    return Ink(
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: fontColor,
      ),
      decoration: ShapeDecoration(
        color: Colors.lightBlue,
        shape: CircleBorder(),
      ),
    );
  }

}
```

之前说过，在单向数据流中需要以特殊的方式使数据返回。  
在此例中，父组件 `StateImprovementPage` 实现了一个 `getCount()` 方法， 用来修改父组件自身的状态（`State`），然后将它作为一个属性（`props`）传递给了子组件 `WithStateWidget`，每当点击加减按钮时，会执行父组件的该方法，从而更新父组件的状态，达成 `数据反流` 的目的。 

---

## 4. Smart | Dumb? （聪明组件 or 笨组件？）   
- Dumb 组件： 只负责渲染，或执行父组件传递的函数或者方法的组件，可以拥有自己的状态，但是它的状态不会向下传递或者参与逻辑。  
比如， 一个显示文字的组件，文字是父组件通过props传递的，而它自身也有一个状态，用来修改自己的背景颜色，但是这个颜色又不影响整个app 的逻辑。  

- Smart 组件： 不仅仅负责渲染，还会参于逻辑的运算。自身状态会作为数据的一部分， 可能会向下传递。因为复杂度高，所以性能比 Dumb 组件要低。  

关于 Smart 和 Dumb 组件的划分，完全取决于具体的业务，还有应用自身的复杂度。不能说全是 Dumb 组件就是最好的，也不能都是 Smart组件。  
Dumb 组件的存在意义主要是为了复用，因为没有强绑定业务的逻辑和数据。  
一个 Dumb 组件最好不要引用 Smart 组件，因为一旦引用就会导致无法复用，所以尽可能不要做这种事。  

![Smart_or_Dumb](./assets/md_images/SmartOrDumb.png)  

---  
## 5. Why State Management？（状态管理？）  
像第三部分所讲的状态提升，是存在局限性的，如果数据的共享嵌套一层两层还好说，但是如果嵌套了很多层，那么通过层级传递函数的方法就会特别反人类。所以此时需要的就是状态管理，它可以让你跨组件间的共享数据。  
Flutter 本身提供了一个用来共享数据的组件 `InheritedWidget`， 当然，也可以使用第三方提供的状态管理的包，如 `Provider`， `Redux`， `Bloc`， 以及 `Mobx`。是否使用包也是看应用的复杂度来实际调整的，如果简单的应用，Flutter 自身提供的组件也能完成任务（如 InheritedWidget， Eventbus），则完全没必要使用第三方包。  

---  
## 6. InheritedWidget （数据共享组件）  
Flutter 提供的 `InheritedWidget` 在思想上跟 `React 自带的 Context` 是一样的。实现的方式，都是在 应用的**顶层定义了一个专门存放数据的组件**，然后该组件**对外提供了一个获取数据的方法**。而需要使用该数据的组件一定**是这个存放数据的组件的子孙组件**， 这样，当子孙组件调用数据组件对外的方法时，就会**在该数据组件中取到对应的数据**。如下图：  

![InheritedWidget](./assets/md_images/InheritedWidget.png)  

下面是 Demo：
1. 首先，实现一个存放数据的 `InheritedWidget`：
```dart
/// data is the data that need to store
/// action is a function that how to change data
/// child is sub widget need to render in this data widget
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
```
其中有两个点：
> static SharedDataWidget of() 方法中， 有一个   
`context.dependOnInheritedWidgetOfExactType()`，这个是用来找到距离当前子组件最近的InheritedWidget（向上查找）。  
> bool updateShouldNotify(SharedDataWidget old) 方法，此方法如果返回 `true`， 则代表依赖此数据组件的子组件会调用 `didChangeDependencies`（即重新渲染）。 
2. 将其作为 app 的顶级组件，并传入数据 以及其子组件：
```dart
class InheritedWidgetPage extends StatefulWidget {

  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();

}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    /// the top widget of app
    /// to share the data to all it's sub widgets
    return SharedDataWidget(
      data: count,
      action: changeCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Inherited Widget'
          ),
          centerTitle: true,
        ),
        body: _buildBody()
      ),
    );
  }

  Widget _buildBody() {
    print(context);

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          WithStateInheritedWidget(),
          WithoutStateInheritedWidget()
        ],
      ),
    );
  }

  /// a function that change sharedDataWidget's state
  /// and then, all sub widget will rebuild
  changeCount(int count) {
    setState(() {
      this.count = count;
    });
  }

}
```  
提供一个修改数据的方法，当 `SharedDataWidget` 的 `state` 被修改时，将触发它的子组件重新渲染。  

3. 在依赖于数据组件的子组件中，通过提供的方法引用或者修改数据：  
```dart

/// widget depend on the shared data widget
/// to display the data named count
class WithoutStateInheritedWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print(context);

    /// get data from the of function of sharedDataWidget 
    final int count = SharedDataWidget.of(context).data;

    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Widget Without State Inherit Ver.',
            style: TextStyle(
              fontSize: 24.0
            ),
          ),
          Expanded(
            child: Center(
              child:  Text(
                'count: $count',
                style: TextStyle(
                  fontSize: 24.0
                )
              ),
            ),
          )
        ],
      ),
    );
  }

}

class WithStateInheritedWidget extends StatefulWidget {

  @override
  _WithStateInheritedWidgetState createState() => _WithStateInheritedWidgetState();

}

class _WithStateInheritedWidgetState extends State<WithStateInheritedWidget> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
        /// ...other code
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      count++;
                      SharedDataWidget.of(context)
                        .action(count);
                    });
                  } 
                ),
       /// ...other code
    );
  }

  /// ...other code

}
```
在依赖 `SharedDataWidget` 数据的组件中，引用 `of` 方法，来获取 `SharedDataWidget` 自身，然后可以获取 `SharedDataWidget` 提供的数据或者方法。  

---  

## 7. EventBus (事件总线)  
所谓的事件总线其实就是 dart 版本的 EventEmitter。（订阅者模式）  
Flutter 并没有提供事件总线。所以可以使用第三方库（eventbus.dart）。  
以下是实现的一个简单的 Eventbus 类：
```dart
typedef void EventCallback(arg);

class EventBus {

  EventBus._internal();

  static EventBus _singleton = new EventBus._internal();

  /// use singleton pattern
  /// let this class always return a single instance
  factory EventBus() => _singleton;

  var _emap = new Map<Object, List<EventCallback>>();

  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  void off(eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }

}
```
因为使用了单例模式，所以在全局只会有一个 Eventbus，使用方法如下：  
```dart
/// widget emit data to listeners
class WithStateEventWidget extends StatefulWidget {

  @override
  _WithStateEventWidgetState createState() => _WithStateEventWidgetState();

}

class _WithStateEventWidgetState extends State<WithStateEventWidget> {

  int count = 0;

  final EventBus bus = EventBus();

  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget With State Eventbus Ver.',
            style: TextStyle(
              fontSize: 24.0
            )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      count++;
                      /// emit the data to listeners
                      bus.emit('changeCount', count);
                    });
                  } 
                ),
                _buildButton(
                  buttonColor: Colors.blue,
                  fontColor: Colors.white,
                  icon: Icons.remove,
                  onPressed: () {
                    setState(() {
                      count--;
                      /// emit the data to listeners
                      bus.emit('changeCount', count);
                    });
                  } 
                ),
                Text(
                  'count: $count',
                  style: TextStyle(
                    fontSize: 24.0
                  )
                )
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
    );
  }

  Widget _buildButton({ Color buttonColor, Color fontColor, icon, onPressed }) {
    return Ink(
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: fontColor,
      ),
      decoration: ShapeDecoration(
        color: Colors.lightBlue,
        shape: CircleBorder(),
      ),
    );
  }

}

/// widget subscribe the data change
class WithoutStateEventWidget extends StatefulWidget {

  @override
  _WithoutStateEventWidgetState createState() => _WithoutStateEventWidgetState();

}

class _WithoutStateEventWidgetState extends State<WithoutStateEventWidget> {

  final EventBus bus = EventBus();

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print(context);

    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black26),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Widget Without State Event Ver.',
            style: TextStyle(
              fontSize: 24.0
            ),
          ),
          Expanded(
            child: Center(
              child:  Text(
                'count: $count',
                style: TextStyle(
                  fontSize: 24.0
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  /// when widget initialized or dispose
  /// register and unregister the eventbus
  @override
  void initState() {
    super.initState();
    bus.on('changeCount', (count) {
      setState(() {
        this.count = count;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    bus.off('changeCount');
  }

}
```  
使用时，记得在生命周期开始注册，在生命周期结束时注销，避免内存泄漏。  

---  