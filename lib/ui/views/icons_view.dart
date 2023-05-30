import 'package:flutter/material.dart';

import 'package:login_dashboard/ui/cards/white_card.dart';
import 'package:login_dashboard/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  
  const IconsView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
       child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1),
          const SizedBox(height: 10),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                title: 'ac_unit_rounded',
                width: 170,
                child: Center(child: Icon(Icons.ac_unit_rounded)),
              ),
              WhiteCard(
                title: 'access_alarm_outlined',
                width: 170,
                child: Center(child: Icon(Icons.access_alarm_outlined)),
              ),
              WhiteCard(
                title: 'accessibility_new_outlined',
                width: 170,
                child: Center(child: Icon(Icons.accessibility_new_outlined)),
              ),
              WhiteCard(
                title: 'add_a_photo_outlined',
                width: 170,
                child: Center(child: Icon(Icons.add_a_photo_outlined)),
              ),
              WhiteCard(
                title: 'switch_camera_outlined',
                width: 170,
                child: Center(child: Icon(Icons.switch_camera_outlined)),
              ),
            ],
          )
        ],
       ),
    );
  }
}