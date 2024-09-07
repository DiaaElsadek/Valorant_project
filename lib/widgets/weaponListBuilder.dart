import 'package:flutter/material.dart';
import 'package:diaa_quiz/models/weapon_model.dart';
import 'package:diaa_quiz/services/weapons_api.dart';
import 'package:diaa_quiz/widgets/weapon_card.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class WeaponListBuilder extends StatefulWidget {
  const WeaponListBuilder({
    super.key,
  });
  @override
  State<WeaponListBuilder> createState() => _MapListBuilderState();
}

class _MapListBuilderState extends State<WeaponListBuilder> {
  late Future<List<WeaponData>> futureWeapons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWeapons = WeaponApi().getWeapons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WeaponData>>(
      future: futureWeapons,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(color: Colors.red, size: 50),
          );
        }

        List<WeaponData> weapons = snapshot.data ?? [];

        if(weapons.isEmpty) {
          return const Center(child: Text('The Maps is Empty'),);
        }

        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: weapons.length,
          separatorBuilder: (context, index) => const SizedBox(height: 50,),
          itemBuilder: (context, index) {
            return WeaponCard(weapon: weapons[index],isRight: (index % 2 == 0));
          },
        );
      },
    );
  }
}
