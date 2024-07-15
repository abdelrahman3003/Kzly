import 'package:flowers_store/gen/assets.gen.dart';
import 'package:flowers_store/views/widgets/shared/content/kzly_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: KzlyContent(
                title: "New",
                trailing: const SizedBox(width: 0),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) => const Divider(
                      height: 1,
                    ),
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: false,
                    selected: true,
                    selectedTileColor: const Color(0xFFF6EEFB),
                    leading: Image.asset(Assets.images.fl2.path),
                    title: const Text(
                      "50% OFF in Vas flower red bouqet Lorem ipsum dolor sit amet consectetur.",
                      maxLines: 2,
                    ),
                    trailing: const Text(
                      '10 days ago',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF96919A),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      print("Notification $index");
                    },
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: KzlyContent(
                title: "Earlier",
                trailing: const SizedBox(width: 0),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                separatorBuilder: (context, index) => const Divider(
                      height: 1,
                    ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(Assets.images.fl2.path),
                    title: const Text(
                      "50% OFF in Vas flower red bouqet Lorem ipsum dolor sit amet consectetur.",
                      maxLines: 2,
                    ),
                    trailing: const Text(
                      '10 days ago',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF96919A),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      print("Notification $index");
                    },
                  );
                }),
          ],
        ));
  }
}
