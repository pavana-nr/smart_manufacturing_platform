import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_manufacturing_platform/controllers/login_controller.dart';
import 'package:smart_manufacturing_platform/views/user/user_info_page.dart';

import 'widgets/dashboard_box_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginController>(context, listen: true);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserInfo()));
                },
                icon: const Icon(
                  Icons.person,
                )),
            centerTitle: true,
            title: const Text("Dashboard"),
            actions: [
              IconButton(
                  onPressed: () {
                    provider.appLogout(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 8.0,
                    runAlignment: WrapAlignment.spaceAround,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      DashboardBoxWidget(
                          name: 'Work Order', imageName: 'work_order'),
                      DashboardBoxWidget(name: 'Shift', imageName: 'shift'),
                      DashboardBoxWidget(
                          name: 'Part Wise', imageName: 'barcode'),
                      DashboardBoxWidget(
                          name: 'Blocked Part', imageName: 'block'),
                      DashboardBoxWidget(
                          name: 'Release Part', imageName: 'box'),
                      DashboardBoxWidget(
                          name: 'Align Part', imageName: 'barcode'),
                      DashboardBoxWidget(
                          name: 'Server Services', imageName: 'data_server'),
                      DashboardBoxWidget(
                          name: 'User Control', imageName: 'user_control'),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
