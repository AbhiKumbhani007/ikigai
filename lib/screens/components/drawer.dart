import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.deepPurple,
      child: Container(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // padding: EdgeInsets.only(top: 0),
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: const UserAccountsDrawerHeader(
                accountName: Text(
                  "Abhishek Kumbhani",
                  style: TextStyle(fontSize: 20),
                ),
                accountEmail: Text(
                  "abhi1234kumbhani@gmail.com",
                  style: TextStyle(fontSize: 13),
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/photos/smiling-indian-business-man-working-on-laptop-at-home-office-young-picture-id1307615661?b=1&k=20&m=1307615661&s=170667a&w=0&h=Zp9_27RVS_UdlIm2k8sa8PuutX9K3HTs8xdK0UfKmYk=')),
              ),
            ),
            // const Divider(color: Colors.grey),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: ListTile(
                leading: Flexible(
                  child: const Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                    size: 27,
                  ),
                ),
                title: const Text('My Profile', style: TextStyle(fontSize: 18)),
                subtitle: const Text('Here is a second line'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: ListTile(
                leading: Flexible(
                  child: const Icon(
                    Icons.event_available,
                    color: Colors.deepPurple,
                    size: 27,
                  ),
                ),
                title:
                    const Text('My Bookings', style: TextStyle(fontSize: 18)),
                subtitle: const Text('Here is a second line'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: ListTile(
                leading: Flexible(
                  child: const Icon(
                    Icons.logout,
                    color: Colors.deepPurple,
                    size: 27,
                  ),
                ),
                title: const Text('Logout', style: TextStyle(fontSize: 18)),
                subtitle: const Text('Here is a second line'),
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
