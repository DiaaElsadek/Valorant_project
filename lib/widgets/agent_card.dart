import 'package:flutter/material.dart';
import 'package:diaa_quiz/pages/agent_card_page.dart';

import '../models/agent_model.dart';
import '../pages/home_page.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({
    super.key,
    required this.agent,
  });

  final AgentData agent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AgentCardPage(agentData: agent),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              height: 430,
              width: 280,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:
                        hexToColorList(agent.backgroundGradientColors ?? []),
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(72),
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.circular(80))),
            ),
            Positioned(
                bottom: 10,
                left: -100,
                child: SizedBox(
                    width: 550,
                    height: 650,
                    child: Image.network(
                      agent.fullPortraitV2 ?? '',
                    ))),
            Positioned(
                bottom: 40,
                left: 30,
                child: Text(
                  agent.displayName ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 36),
                ))
          ]),
        ],
      ),
    );
  }
}
