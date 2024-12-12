import 'package:flutter/material.dart';

class AnimatedSplitWidget extends StatefulWidget {
  @override
  _AnimatedSplitWidgetState createState() => _AnimatedSplitWidgetState();
}

class _AnimatedSplitWidgetState extends State<AnimatedSplitWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _onFocusChange(bool hasFocus) {
    setState(() {
      _isFocused = hasFocus;
    });
    if (hasFocus) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Split Widget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                height: 60,
                width: 300,
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                color: Colors.blue
                                    .withOpacity(_animation.value), // Left part
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 60,
                                color: Colors.blue.withOpacity(
                                    _animation.value), // Right part
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Tap to focus",
                          border: OutlineInputBorder(),
                        ),
                        onTap: () => _onFocusChange(true),
                        onEditingComplete: () => _onFocusChange(false),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
