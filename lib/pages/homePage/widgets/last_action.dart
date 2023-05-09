import 'package:flutter/material.dart';

class LastAction extends StatelessWidget {
  const LastAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your last activity: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bench_press.jpg"),
                  scale: 4,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: DefaultTextStyle.merge(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Bench press')],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
