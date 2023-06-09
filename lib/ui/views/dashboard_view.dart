import 'package:flutter/material.dart';

import 'package:login_dashboard/ui/cards/white_card.dart';
import 'package:login_dashboard/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  
  const DashboardView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
       child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1),
          const SizedBox(height: 10),

          const WhiteCard(
            title: 'Sales Statistics',
            child: Text('Hola mundo'),
          ),
        ],
       ),
    );
  }
}