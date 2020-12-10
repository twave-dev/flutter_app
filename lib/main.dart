import 'package:flutter/material.dart';

// 클래스, enum 이나 typedef, extension 등에는 UpperCamelCase
// 라이브러리, 패키지, 디렉토리, 소스 파일 이름 및 import prefix에는 lowercase_with_underscores
// 그 외의 이름에는 lowerCamelCase
// 상수값(Constant)에서도 lowerCamelCase

// flutter 웹실행 : flutter run -d chrome --web-port=8080 --web-hostname=10.211.105.182

// 파일 자동저장 끄기 : Settings>System Settings>Appearance & Behavior>Synchronization : Save files on frame deactivation 체크해제
// 저장하지 않은 파일 * 표시하기 : Settings>Editor>General>Editor Tabs>Appearance : Mark modified (*)

// Ctrl + z : undo(되돌리기), Ctri + Shift + z : redo(앞으로가기)
// Ctrl + y : 한줄/혹은 여러줄 삭제
// Shift + Alt + up/down : 줄 이동

// 메인함수 : void main() => runApp(MyApp());
void main() {
  // 주어진 위젯(MyApp)을 위젯트리의 루트로 만든다. 그리고 플러터 프레임워크는 루트 위젯이 화면을 덮도록 한다.
  runApp(MyApp());
}

// 정적인 위젯
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This widget is the root of your application.
    print('#################################');
    print('## build - MyApp');

    // MaterialApp 위젯은 플러터 프레임워크가 제공하는 모든 기본 위젯과 디자인 테마를 사용가능하게 해줌
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true, // 디버그 리본
      theme: ThemeData(
        primarySwatch: Colors.teal,
        // 기본적으로 사용할 색상 견본 (특정 색의 음영들을 기본 색상으로 지정해서 사용하겠다는 의미)
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
          title:
              'Flutter Demo Home Page2'), // home은 앱이 정상적으로 실행되었을때 가장 먼저 화면에 보여주는 경로.
    );
  }
}

// 상태(State)를 가진 위젯 : Stateful Widget 은 State 라는 서브클래스를 갖고 있다.
/*
상태(State) 위젯 라이프싸이클.
** createState()
mounted == true
initState()
didChangeDependencies()
** build()
didUpdateWidget()
** setState()
deactivate()
dispose()
mounted == false
 */
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // 부모로 부터 받은 title
  final String title;

  // 플러터가 StatefulWidget 을 빌드하도록 지시하면 즉시 createState() 가 호출된다.
  // 이 메서드는 반드시 존재해야 한다.
  @override
  _MyHomePageState createState() => _MyHomePageState(); // 언더스코어(_)는 private 를 의미
}

// 상태(State) : 동적으로 변화하는 데이터의 집합
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // setState 메소드는 플러터 프레임워크에서 어떤 상태를 변경하려는 경우에 사용
    // setState 메소드가 호출되면 상태(State)가 변경되었음을 플러터 프레임워크에 알려서 build 메소드가 다시 실행되도록 한다.
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('#################################');
    print('## build - _MyHomePageState extends State<MyHomePage> ');

    // Scaffold() 위젯 : 무언가를 혼자 해낼 수 있도록 발판을 만들어주다 라는 의미.
    return Scaffold(
      // appBar : AppBar
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // body : 앱 화면을 만드는 시작점
      // Center : 레이아웃 위젯. 한개의 자식(child) 위젯을 가질 수 있고, 부모의 중앙에 위치
      body: Center(
        // Column : 레이아웃 위젯. 여러개의 자식(children) 요소들을 세로로 배치
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // 기준축
          children: <Widget>[
            // [] 배열을 의미
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      // floatingActionButton : 플로팅 액션 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );

  }
}
