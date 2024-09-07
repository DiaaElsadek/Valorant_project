import 'package:dio/dio.dart';
import 'package:diaa_quiz/models/agent_model.dart';

class AgentsApi {
  final Dio dio = Dio();

  Future<List<AgentData>> getAgents() async {
    try {
      Response response = await dio.get('https://valorant-api.com/v1/agents');
      Map<String, dynamic> json = response.data;
      List<dynamic> agentsData = json['data'];

      List<AgentData> agents = []; // Now I have list of agentData (داتا تفصيلية)

      for(var article in agentsData) {
        agents.add(AgentData.fromJson(article));
      }

      return agents;
    } catch (e) {
      return [];
    }
  }
}