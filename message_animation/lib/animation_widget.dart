import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimationMessage extends StatefulWidget {
  AnimationMessage({Key key}) : super(key: key);

  @override
  _AnimationMessageState createState() => _AnimationMessageState();
}

class _AnimationMessageState extends State<AnimationMessage> {
  bool expanded = false;
  final scrollController = ScrollController();

  void _onScrollDirection() {
    print(
        "userScrollController ${scrollController.position.userScrollDirection}");

    if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        expanded) {
      setState(() {
        expanded = false;
      });
    } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        !expanded) {
      setState(() {
        expanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AndroidMessageWidget(
        expanded: expanded,
        onTap: () {
          print("this is your button custimize");
        },
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Icon(Icons.search),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Search conversations"),
                )),
                Icon(Icons.more_vert_outlined),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (details) {
                _onScrollDirection();
                return true;
              },
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return AndroidMessageItem(
                      color: Colors.primaries[index % Colors.primaries.length],
                    );
                  }),
            ),
          )
        ],
      )),
    );
  }
}

class AndroidMessageItem extends StatelessWidget {
  const AndroidMessageItem({Key key, this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(
          Icons.person,
          color: Colors.black87,
        ),
      ),
      title: Text("Hello"),
      subtitle: Text("Hello, welcome the flutter learning"),
      trailing: Text("30 min"),
    );
  }
}

const _duration = Duration(milliseconds: 250);
const _minSize = 50.0;
const _maxSize = 150.0;
const _iconSize = 24.0;

class AndroidMessageWidget extends StatelessWidget {
  const AndroidMessageWidget({Key key, this.expanded = false, this.onTap})
      : super(key: key);
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final position = _minSize / 2 - _iconSize / 2;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
          duration: _duration,
          width: expanded ? _maxSize : _minSize,
          height: _minSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_minSize),
            color: Colors.blue[800],
          ),
          child: Stack(
            children: [
              Positioned(
                left: position,
                top: position,
                child: Icon(Icons.message),
              ),
              Positioned(
                left: position + 1.5 * _iconSize,
                top: position,
                child: Text(
                  "Start Chat",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          )),
    );
  }
}
