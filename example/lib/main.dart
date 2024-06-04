import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:button_customize/button_customize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTile(
                title: const Text('Title and Icon'),
                children: <Widget>[
                  ListTile(
                    title: ButtonCustomizeWidget(
                      isLoading: _isLoading,
                      title: "Click me!",
                      backgroundColor: Colors.orange,
                      onTap: (){},
                    ),
                  ),

                  ListTile(
                    title: ButtonCustomizeWidget(
                      isLoading: _isLoading,
                      title: "Click me!",
                      backgroundColor: Colors.green[50],
                      titleTextStyle: const TextStyle(color: Colors.orange),
                      onTap: (){},
                    ),
                  ),

                  ListTile(
                    title: ButtonCustomizeWidget(
                      isLoading: _isLoading,
                      title: "Click me!",
                      backgroundColor: Colors.blue,
                      titleTextStyle: const TextStyle(color: Colors.white),
                      loadingColor: Colors.brown,
                      onTap: (){},
                    ),
                  ),

                  ListTile(
                    title: ButtonCustomizeWidget(
                      isLoading: _isLoading,
                      title: "Click me!", 
                      borderRadius: BorderRadius.circular(8),
                      icon: const Icon(Icons.favorite, size: 16,),
                      iconPosition: IconPosition.left,
                      loadingColor: Colors.pink,
                      onTap: (){}, 
                    ),
                  ),

                  ListTile(
                    title: ButtonCustomizeWidget(
                      isLoading: _isLoading,
                      title: "Click me!", 
                      icon: const Icon(Icons.favorite, color: Colors.green,),
                      iconPosition: IconPosition.right,
                      loadingColor: Colors.cyan,
                      onTap: (){}, 
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('Custom Title Widget and Icon'),
                children: <Widget>[
                  ListTile(
                    title: ButtonCustomizeWidget(
                      isLoading: _isLoading,
                      backgroundColor: Colors.blueGrey,
                      titleWidget: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: "Demo."),
                            const TextSpan(text: " "),
                            TextSpan(
                              text: "Click Me!", 
                              style: const TextStyle(decoration: TextDecoration.underline,),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  debugPrint('tapped');
                                }
                            )
                          ],
                        ),
                      ),
                      onTap: (){},
                    ),
                  ),

                  ListTile(
                    title: ButtonCustomizeWidget(
                      isLoading: _isLoading,
                      backgroundColor: Colors.brown,
                      height: 60,
                      titleWidget: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "Demo."),
                            TextSpan(text: " "),
                            TextSpan(
                              text: "Click Me!", 
                            )
                          ],
                        ),
                      ),
                      iconPosition: IconPosition.left,
                      icon: const Icon(Icons.star),
                      onTap: (){},
                    ),
                  ),

                  ListTile(
                    title: ButtonCustomizeWidget(
                      isLoading: _isLoading,
                      titleWidget: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "Demo."),
                            TextSpan(text: " "),
                            TextSpan(
                              text: "Click Me!", 
                            )
                          ],
                        ),
                      ),
                      iconPosition: IconPosition.right,
                      icon: const Icon(Icons.star),
                      loadingWidget: FlutterLogo(size: 20),
                      onTap: (){},
                    ),
                  ),
                ],
              ),

              ExpansionTile(
                title: const Text('Only Icon'),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        ButtonCustomizeWidget(
                          isLoading: _isLoading,
                          backgroundColor: Colors.grey[200],
                          icon: const Icon(Icons.star, color: Colors.amber,),
                          onTap: (){},
                        ),
                        const SizedBox(width: 16,),
                        ButtonCustomizeWidget(
                          isLoading: _isLoading,
                          icon: const Icon(Icons.info),
                          loadingColor: Colors.orange,
                          onTap: (){
                            setState(() {
                              _isLoading = false;
                            });
                          },
                        ),
                        const SizedBox(width: 16,),
                        ButtonCustomizeWidget(
                          isLoading: _isLoading,
                          width: 44,
                          borderRadius: BorderRadius.circular(8),
                          icon: const Icon(Icons.info),
                          onTap: (){
                            setState(() {
                              _isLoading = true;
                            });
                          },
                        )
                      ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Center(
                    child: ButtonCustomizeWidget(
                        isLoading: _isLoading,
                        icon: const Icon(Icons.info),
                        loadingColor: Colors.orange,
                        iconPosition: IconPosition.center,
                        onTap: (){
                          setState(() {
                            _isLoading = false;
                          });
                        },
                      ),
                  )
                ],
              ),
              const SizedBox(height: 32,),
            ],
          ),
        ),
      ),
    );
  }
}