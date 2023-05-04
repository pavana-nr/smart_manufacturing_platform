import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_manufacturing_platform/controllers/login_controller.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginController>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("User Profile"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Name"),
                        Text(loginProvider.login.data!.name),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Role"),
                        Text(loginProvider.login.data!.role),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Employeee ID"),
                        Text(loginProvider.login.data!.employeeId),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Email"),
                        Text(loginProvider.login.data!.email),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Phone Number"),
                        Text(loginProvider.login.data!.phone),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Department"),
                        Text(loginProvider.login.data!.department),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Location"),
                        Row(
                          children: [
                            Text(loginProvider.login.data!.location.join(', ')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Line"),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.0,
                              child: Text(
                                loginProvider.login.data!.line.join(', '),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Plants"),
                        Row(
                          children: [
                            Text(loginProvider.login.data!.plants.join(', ')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Created At"),
                        Text(loginProvider.login.data!.createdAt!),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Last updated At"),
                        Text(loginProvider.login.data!.lastUpdatedAt!),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Assigned Stations"),
                        IconButton(
                            onPressed: () {
                              _showModalBottomSheet(context,
                                  loginProvider.login.data!.assignStationId);
                            },
                            icon: const Icon(
                              Icons.arrow_right,
                            )),
                      ],
                    ),
                  ),
                ]),
              ),
            )));
  }
}

void _showModalBottomSheet(BuildContext context, List<String> assignStationId) {
  showModalBottomSheet(
    elevation: 10,
    context: context,
    isDismissible: true,
    enableDrag: true,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Assigned Stations",
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.lightBlueAccent,
            child: Row(
              children: const [
                Expanded(
                    child: Text(
                  'Parameter',
                  style: TextStyle(color: Colors.white),
                )),
                Expanded(
                    child: Text(
                  'Value',
                  style: TextStyle(color: Colors.white),
                ))
              ],
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.black,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: assignStationId.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              index.toString(),
                              style: const TextStyle(color: Colors.white),
                            )),
                            Expanded(
                                child: Text(
                              assignStationId[index],
                              style: const TextStyle(color: Colors.white),
                            ))
                          ],
                        ));
                  }),
            ),
          ),
        ],
      );
    },
  );
}
