import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:diaa_quiz/providers/main_provider.dart';
import 'package:diaa_quiz/services/agent_services.dart';

import '../models/agent_model.dart';
import 'agent_list_view.dart';

class AgentListBuilder extends StatefulWidget {
  const AgentListBuilder({
    super.key,
  });

  @override
  State<AgentListBuilder> createState() => _AgentListBuilderState();
}

class _AgentListBuilderState extends State<AgentListBuilder> {
  late Future<List<AgentData>> futureAgents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAgents = AgentsApi().getAgents();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<AgentData>>(
      future: futureAgents,
      builder: (context, snapshot) {
        List<AgentData> agents = [];

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(color: Colors.red, size: 50),
          );
        }

        agents = snapshot.data ?? [];

        if (agents.isEmpty) {
          return const Center(
            child: Text('The Agents is Empty'),
          );
        }

        return AgentListView(agents: agents);
      },
    );
  }
}
