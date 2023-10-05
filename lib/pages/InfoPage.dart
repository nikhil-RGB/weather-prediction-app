import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: infoWidget(),
    ));
  }

  Widget infoWidget() {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Preventive measures during a cloudburst",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset("assets/images/sample.jpg")),
            ),
            subTitle(text: "1. Don't Panic"),
            const SizedBox(
              height: 10,
            ),
            subText(
                text:
                    "First and foremost you should remain calm. Panic never helps in an emergency situation instead you should have your wits about you and ensure your safety and the safety of those around you."),
            const SizedBox(
              height: 20,
            ),
            subTitle(text: "2. Avoid Going Out"),
            const SizedBox(
              height: 10,
            ),
            subText(
                text:
                    "Don’t go out unnecessarily when a cloudburst occurs. Cloudbursts can cause flash floods which can be a threat to human lives."),
            const SizedBox(
              height: 20,
            ),
            subTitle(text: "3. Have a secondary power supply ready"),
            const SizedBox(
              height: 10,
            ),
            subText(
                text:
                    "During heavy rainfall, blackouts are common. It is wise to plan ahead for such a scenario and have a backup power source ready beforehand like a generator or a UPS."),
            const SizedBox(
              height: 20,
            ),
            subTitle(text: "4. Take Shelter"),
            const SizedBox(
              height: 10,
            ),
            subText(
                text:
                    "If you are already out of home at the time of a cloudburst, take shelter somewhere. Don’t stand in the rain or go near flooded areas to prevent drowning. Also, stay away from electrical poles or wires to protect yourself from getting electrocuted."),
            const SizedBox(
              height: 20,
            ),
            subTitle(text: "5. Stay up-to-date with the latest news"),
            const SizedBox(
              height: 10,
            ),
            subText(
                text:
                    "It is important to stay updated on the latest news for important information like flooded areas and weather predictions for your safety."),
            const SizedBox(
              height: 20,
            ),
            subTitle(text: "6. Emergency kits can come in handy"),
            const SizedBox(
              height: 10,
            ),
            subText(
                text:
                    "In times of a catastrophe, a first aid kit can really help. You should prepare an emergency kit in advance so it may be used when needed."),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget subTitle({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subText({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
