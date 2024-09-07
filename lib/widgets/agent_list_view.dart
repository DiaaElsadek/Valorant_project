import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/agent_model.dart';
import 'agent_card.dart';

class AgentListView extends StatelessWidget {
  const AgentListView({
    super.key,
    required this.agents,
  });

  final List<AgentData> agents;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: agents.map((e) {
        return e.fullPortraitV2 != null ? AgentCard(agent: e) : const Padding(
          padding: EdgeInsets.only(top: 128.0,right: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: Color(0xffFD4556),
                size: 128,
              ),
              SizedBox(height: 10,),
              Text('Image Not Found',style: TextStyle(fontSize: 32,color: Colors.black, fontWeight: FontWeight.bold),)
            ],
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 501,
        autoPlay: true, // Enable auto-play
        enableInfiniteScroll: true,
      ),
    );
  }
}
