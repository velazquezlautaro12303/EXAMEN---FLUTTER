import 'package:flutter/material.dart';
import 'package:flutter_application_3/Data/DataSource/data_drawer.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
    required this.selectedIndexDrawer,
    required this.nameUser,
  });

  final int selectedIndexDrawer;
  final String nameUser;

  @override
  State<MyDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: widget.selectedIndexDrawer,
      onDestinationSelected: (value) {
        // selectedIndexDrawer = value;
        itemsDrawer[value].function();
        // setState(() {});
        print(itemsDrawer[value].link);
        context.go(itemsDrawer[value].link);
      },
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "@${widget.nameUser}",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://w7.pngwing.com/pngs/524/696/png-transparent-computer-icons-user-symbol-symbol-miscellaneous-black-computer-icons.png",
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ...itemsDrawer.sublist(0, itemsDrawer.length - 1).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        const Divider(),
        NavigationDrawerDestination(
          icon: Icon(itemsDrawer.last.icon),
          label: Text(itemsDrawer.last.title),
        ),
      ],
    );
  }
}
