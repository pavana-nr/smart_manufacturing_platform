import 'package:flutter/material.dart';
import 'package:smart_manufacturing_platform/views/work_order/work_order_page.dart';

class DashboardBoxWidget extends StatefulWidget {
  const DashboardBoxWidget({
    Key? key,
    required this.name,
    required this.imageName,
  }) : super(key: key);
  final String name;
  final String imageName;

  @override
  State<DashboardBoxWidget> createState() => _DashboardBoxWidgetState();
}

class _DashboardBoxWidgetState extends State<DashboardBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WorkOrderPage()),
        );
      },
      child: Container(
        width: 170.0,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white),
        margin: const EdgeInsets.all(14.0),
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${widget.imageName}.png',
              width: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                widget.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
