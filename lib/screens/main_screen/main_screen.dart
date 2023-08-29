import 'package:domino_point/src/helper/assets.dart';
import 'package:domino_point/src/helper/sp_consts.dart';
import 'package:domino_point/src/helper/spcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      player[0] = value.getInt("player0") ?? 0;
      player[1] = value.getInt("player1") ?? 0;
      setState(() {});
    });
  }

  List<int> player = [0, 0];

  List<MapEntry<int, int>> history = [];
  List<MapEntry<int, int>> future = [];

  List<int> playerLastScore = [0, 0];

  String img = SPConst.domnino[0][0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: history.length > 0 ? 1 : 0.5,
              child: IconButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  SharedPreferences.getInstance().then(
                    (value) {
                      // undo
                      if (history.length > 0) {
                        var last = history.last;
                        history.removeLast();
                        future.add(last);
                        player[last.key] -= last.value;
                        value.setInt("player${last.key}", last.value);
                        setState(() {});
                      }
                    },
                  );
                },
                icon: Icon(Icons.undo),
              ),
            ),
            IconButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                SharedPreferences.getInstance().then(
                  (value) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog.adaptive(
                        content: Text("Are you sure?"),
                        title: Text("Reset"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              value.setInt("player0", 0);
                              value.setInt("player1", 0);
                              setState(
                                () {
                                  player[0] = 0;
                                  player[1] = 0;
                                  history.clear();
                                  future.clear();
                                },
                              );
                              Navigator.pop(context);
                            },
                            child: Text("Reset"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.refresh),
            ),
            Opacity(
              opacity: future.length > 0 ? 1 : 0.5,
              child: IconButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  SharedPreferences.getInstance().then(
                    (value) {
                      // redo
                      if (future.length > 0) {
                        var last = future.last;
                        future.removeLast();
                        history.add(last);
                        player[last.key] += last.value;
                        value.setInt("player${last.key}", last.value);
                        setState(() {});
                      }
                    },
                  );
                },
                icon: Icon(Icons.redo),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Colors.red,
                child: Column(
                  children: [
                    Expanded(child: SingleChildScrollView(child: pointCell(0))),
                    buttons(0),
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Expanded(child: SingleChildScrollView(child: pointCell(1))),
                    buttons(1),
                  ],
                ),
              )),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 4,
            child: Center(
              child: Container(
                width: 190,
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   border: Border.all(color: Colors.black, width: 2),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 5,
                      bottom: 5,
                      child: Center(
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Text(player[0].toString(),
                              style: SPColors.lightTextColor20.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 5,
                      bottom: 5,
                      child: Center(
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Text(player[1].toString().toString(),
                              textAlign: TextAlign.right,
                              style: SPColors.lightTextColor20.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          color:
                              player[0] > player[1] ? Colors.red : Colors.blue,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                        child: Center(
                          child: Text((player[0] - player[1]).abs().toString(),
                              style: SPColors.lightTextColor24.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pointCell(int playerIndex) {
    // / is 10
    // X is 20
    // O is 5

    // each cell is 100 point,
    //the first row is 80 point using / X. ex XX/ us 50 point
    //the second row is 20 point using O. ex OO us 10 point
/* 
    var points = player[playerIndex];
    print("points: $points [$playerIndex]");

    int numOfCells = (points / 100).ceil();
    print("numOfCells: $numOfCells");

    int cell = (points / 100).ceil();
    print("cell: $cell");

    int row1 = ((points % 100) / 20).floor();
    if (row1 > 4) row1 = 4;
    print("row1: $row1");

    int row2 = (((points % 100) - (row1 * 10)) / 5).floor();
    print("row2: $row2"); */

    var points = player[playerIndex];
    print("points: $points [$playerIndex]");

    int numOfCells = (points / 100).ceil();
    print("numOfCells: $numOfCells");

    if (points > 100) {
      points = points - ((numOfCells - 1) * 100);
      print("pointsA100: $points [$playerIndex]");
    }

    int numberOfX = (points / 20).floor();
    if (numberOfX > 4) numberOfX = 4;
    print("numberOfX: $numberOfX");
    int numberOfL = (points % 20) ~/ 10;
    if (numberOfX >= 4) numberOfL = 0;
    print("numberOfL: $numberOfL");
    int numberOfO = (points % 10) ~/ 5;
    print("numberOfO: $numberOfO");
    if (points >= 80) {
      var pPoint = points - 80;
      print("pPoint: $pPoint");
      numberOfO = pPoint ~/ 5;
      print("numberOfO AF: $numberOfO");
    }

    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        const Divider(
          color: Colors.black38,
          thickness: 1,
        ),
        if (numOfCells > 1)
          for (var i = 0; i < numOfCells - 1; i++)
            Stack(
              children: [
                Container(
                  child: Column(children: [
                    Row(
                      children: [
                        for (var i = 0; i < 4; i++) imgXOL(Assets.assetsIconsX),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < 4; i++) imgXOL(Assets.assetsIconsO),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ]),
                ),
                Opacity(
                  opacity: 0.5,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Image.asset(
                        Assets.assetsDominoXx,
                        width: Get.width / 3,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "${(i + 1) * 100}",
                    style: SPColors.lightTextColor36,
                  ),
                ),
              ],
            ),
        Row(
          children: [
            if (numberOfX == 0 && numberOfL == 0) imgXOL("empty"),
            for (var i = 0; i < numberOfX; i++) imgXOL(Assets.assetsIconsX),
            for (var i = 0; i < numberOfL; i++) imgXOL(Assets.assetsIconsL),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            if (numberOfO == 0) imgXOL("empty"),
            for (var i = 0; i < numberOfO; i++) imgXOL(Assets.assetsIconsO),
          ],
        ),
        const Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ],
    );
  }

  Padding imgXOL(String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (Get.width / 2 / 10) * 0.75),
      child: imagePath == "empty"
          ? Container(
              height: Get.width / 2 / 11,
            )
          : Image.asset(imagePath,
              width: Get.width / 2 / 11, color: Colors.white),
    );
  }

  Widget buttons(int player) {
    double btnHeight = 50;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                btnCell(btnHeight, player, 5),
                btnCell(btnHeight, player, 10),
              ],
            ),
            Row(
              children: [
                btnCell(btnHeight, player, 15),
                btnCell(btnHeight, player, 20),
              ],
            ),
            Row(
              children: [
                btnCell(btnHeight, player, 25),
                btnCell(btnHeight, player, 30),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded btnCell(double btnHeight, int playerIndex, int value) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        setState(() {
          player[playerIndex] += value;
          history.add(MapEntry(playerIndex, value));
          playerLastScore[playerIndex] = value;
          SharedPreferences.getInstance().then((value) {
            value.setInt("player$playerIndex", player[playerIndex]);
          });
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: btnHeight,
        color: Colors.amber,
        child: Center(
            child: Text(
          "$value",
          style: SPColors.darkTextColor24.copyWith(
            color: value == playerLastScore[playerIndex]
                ? Colors.red
                : SPColors.primary.shade900,
          ),
        )),
      ),
    ));
  }
}
