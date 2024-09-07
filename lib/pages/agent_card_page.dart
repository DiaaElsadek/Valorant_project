import 'package:flutter/material.dart';
import 'package:diaa_quiz/models/agent_model.dart';

class AgentCardPage extends StatelessWidget {
  const AgentCardPage({super.key,required this.agentData});

  final AgentData agentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff0F1923),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(agentData.displayName!,style: const TextStyle(fontSize: 24),),
        actions: [
          Image.network(agentData.role?.displayIcon ?? '',width: 30,height: 30,)
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 25,),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(height: 450,width: double.infinity,child: Image.network(agentData.background ?? '')),
              Positioned(
                bottom: 50,
                  right: -50,
                  child: SizedBox(
                    height: 455,
                      child: Image.network(agentData.fullPortraitV2 ?? '',)))
            ],
          ),
          const Align(alignment: Alignment.bottomLeft,child: Text('Description',style: TextStyle(color: Colors.white,fontSize: 24),)),
          const SizedBox(height: 10,),
          Text(agentData.description ?? '',style: const TextStyle(color: Colors.white,fontSize: 20),),
          const SizedBox(height: 10,),
          const Align(alignment: Alignment.bottomLeft,child: Text('Aibilty',style: TextStyle(color: Colors.white,fontSize: 24),)),
          const Spacer(),
          Row(
            children: [
              AibiltyCard(agentData: agentData,number: 0),
              AibiltyCard(agentData: agentData,number: 1),
              AibiltyCard(agentData: agentData,number: 2),
              AibiltyCard(agentData: agentData,number: 3,)
            ],
          )
        ],
      ),
    );
  }
}

class AibiltyCard extends StatelessWidget {
  const AibiltyCard({
    super.key,
    required this.agentData,
    required this.number
  });

  final AgentData agentData;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 85,
        height: 85,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(color: Colors.white)
        ),
        child: Image.network(agentData.abilities![number].displayIcon ?? ''));
  }
}
