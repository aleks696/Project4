import 'package:flutter/material.dart';
import 'package:project4/widgets/list_tile.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const FloatingActionButtonWidget({
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showMenu(
          context: context,
          position: const RelativeRect.fromLTRB(150, 570, 0, 0),
          items: <PopupMenuEntry>[
            PopupMenuItem(
              child: ListTileWidget(
                title: 'Red',
                color: Colors.redAccent,
                onTap: () {
                  onTap(1);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Red button pressed'),
                  ));
                  Navigator.pushNamed(context, '/red_pill');
                },
              ),
            ),
            PopupMenuItem(
              child: ListTileWidget(
                title: 'Blue',
                color: Colors.blueAccent,
                onTap: () {
                  onTap(2);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Blue button pressed'),
                  ));
                  Navigator.pushNamed(context, '/blue_pill');
                },
              ),
            )
          ],
          elevation: 8.0,
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
