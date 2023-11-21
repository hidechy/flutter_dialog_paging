import 'package:flutter/material.dart';

///
void main() => runApp(const MyApp());

///
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SamplePage());
  }
}

//=======================================//

///
class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const CustomDialog();
              },
            );
          },
          child: const Text('ダイアログ'),
        ),
      ),
    );
  }
}

//=======================================//

///
class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.all(32),
      content: Navigator(
        onGenerateRoute: (_) {
          return MaterialPageRoute(
            builder: (context) {
              //----------------------//

              return SizedBox(
                width: 400,
                child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('1'),
                  ),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const NextDialog();
                            },
                          ),
                        );
                      },
                      child: const Text('2のページに進む'),
                    ),
                  ),
                ),
              );

              //----------------------//
            },
          );
        },
      ),
    );
  }
}

//=======================================//

///
class NextDialog extends StatelessWidget {
  const NextDialog({super.key});

  @override
  Widget build(BuildContext context) {
    //----------------------//

    return SizedBox(
      width: 400,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('2'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('1のページに戻る'),
          ),
        ),
      ),
    );

    //----------------------//
  }
}
