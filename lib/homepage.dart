import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub7a/colors.dart';
import 'package:sub7a/count.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  int radio = 0;
  int colorHex = 0xff656FD1;
  int _counter = 0;
  int _time = 0;
  int _goal = 0;
  //bool showColor = true;

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(colorHex);
    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        /////////////////Floating Action Button
        floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () {
            resetToZero();
          },
          child: const Icon(
            Icons.refresh,
          ),
        ),

        ///////////////AppBar
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  // showColor = !showColor;
                },
                icon: Icon(Icons.more_horiz))
          ],
        ),
        /////////////////Body
        body: Column(
          children: [
            Container(
              color: mainColor,
              height: size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Center(
                      child: Text(
                    "الهدف",
                    style: TextStyle(
                        color: Colors.white, fontSize: 30, fontFamily: "arb"),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            resetToZero();
                            setGoal(_goal - 1);
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                          )),
                      Text(
                        "$_goal",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      IconButton(
                          onPressed: () {
                            resetToZero();
                            setGoal(_goal + 1);
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            resetToZero();
                            setGoal(_goal + 1000);
                          },
                          child: Count(count: "1000+")),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            resetToZero();
                            setGoal(_goal + 100);
                          },
                          child: Count(count: "100+")),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            resetToZero();
                            setGoal(100);
                          },
                          child: Count(count: "100")),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            resetToZero();
                            setGoal(99);
                          },
                          child: Count(count: "99")),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "الاستغفار",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("$_counter", style: const TextStyle(fontSize: 28)),
                const SizedBox(
                  height: 10,
                ),

                ////////CircularIndicator
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_counter == _goal) {
                        setTime(_time + 1);
                        setCount(_counter = 1);
                      } else {
                        setCount(_counter + 1);
                      }
                    });
                  },
                  child: CircularPercentIndicator(
                    radius: 80,
                    lineWidth: 10.0,
                    percent: (_counter / _goal) >= 1 ? 0.1 : (_counter / _goal),
                    center: Icon(
                      Icons.touch_app,
                      size: 50.0,
                      color: mainColor,
                    ),
                    backgroundColor: mainColor.withOpacity(0.5),
                    progressColor: mainColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("مرات التكرار :$_time",
                    style: const TextStyle(fontSize: 24, fontFamily: "arb")),
                const SizedBox(
                  height: 10,
                ),
                Text("المجموع :${_goal * _time + _counter}",
                    style: const TextStyle(fontSize: 24, fontFamily: "arb")),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Radio(
                    fillColor: MaterialStateColor.resolveWith((states) => kred),
                    value: 0xffFF4546,
                    groupValue: colorHex,
                    onChanged: (val) {
                      setState(() {
                        colorHex = val!;
                        setColor(val);
                      });
                    }),
                Radio(
                    fillColor:
                        MaterialStateColor.resolveWith((states) => kyello),
                    value: 0xffEBA31A,
                    groupValue: colorHex,
                    onChanged: (val) {
                      setState(() {
                        colorHex = val!;
                        setColor(val);
                      });
                    }),
                Radio(
                    fillColor:
                        MaterialStateColor.resolveWith((states) => kblue),
                    value: 0xff656FD1,
                    groupValue: colorHex,
                    onChanged: (val) {
                      setState(() {
                        colorHex = val!;
                        setColor(val);
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  resetToZero() {
    setCount(0);
    setGoal(0);
    setTime(0);
  }

  setCount(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("count", value);
    getData();
  }

  setGoal(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("goal", value);
    getData();
  }

  setTime(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("time", value);
    getData();
  }

  setColor(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("color", value);
    getData();
  }

  getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _counter = pref.getInt("count") ?? 0;
      _time = pref.getInt("time") ?? 0;
      _goal = pref.getInt("goal") ?? 0;
      colorHex = pref.getInt("color") ?? 0xff656FD1;
    });
  }
}
