import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late AnimationController _imageAnimationController;

  @override
  void initState() {
    super.initState();

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _startAnimations();
  }

  void _startAnimations() {
    _textAnimationController.forward();
    _imageAnimationController.forward();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    _imageAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBCA19),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _imageAnimationController,
                child: Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1, 0),
                            end: Offset(-0.41, 0.01),
                          ).animate(
                            CurvedAnimation(
                              parent: _imageAnimationController,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/logos/logospef.png',
                              width: 140,
                              height: 140,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          child: FadeTransition(
                            opacity: _textAnimationController,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(-1, 0),
                                end: Offset(-50, 0),
                              ).animate(
                                CurvedAnimation(
                                  parent: _textAnimationController,
                                  curve: Curves.easeInOut,
                                ),
                              ),
                              child: Text(
                                'SPEF',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
