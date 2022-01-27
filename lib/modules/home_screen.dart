import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tic_tac_game/game_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool multi = false;
  String activePlayer = 'X';
  String result = '';
  bool gameOver = false;
  int turn = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 1, 30, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SwitchListTile.adaptive(
                activeColor: Colors.pink,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                title: Text(
                  'Turn On Multi Player',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                      ),
                ),
                value: multi,
                onChanged: (value) {
                  setState(() {
                    multi = !multi;
                    Player.playerO = [];
                    Player.playerX = [];
                    activePlayer = 'X';
                    result = '';
                    gameOver = false;
                  });
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "It's ",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    activePlayer,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color:
                              activePlayer == 'X' ? Colors.blue : Colors.pink,
                        ),
                  ),
                  Text(
                    " Turn",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return onTap(index, multi);
                  },
                ),
              ),
              if (result != '')
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Winner is Player ',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      result,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: result == 'X' ? Colors.blue : Colors.pink,
                          ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                  ),
                  onPressed: () {
                    setState(() {
                      Player.playerO = [];
                      Player.playerX = [];
                      activePlayer = 'X';
                      result = '';
                      gameOver = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.replay_outlined,
                      ),
                      Text('Repeat the game'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTap(
    int index,
    bool multi,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: gameOver
          ? null
          : () {
              if (!Player.playerO.contains(index) &&
                  !Player.playerX.contains(index)) {
                Game.play(index, activePlayer);
                setState(() {
                  turn++;
                  activePlayer = activePlayer == 'X' ? 'O' : 'X';
                });
                if (!multi && Game.checkWinner() == '') {
                  Game.autoPlay(
                    activePlayer,
                  );
                  setState(() {
                    activePlayer = activePlayer == 'X' ? 'O' : 'X';
                  });
                }
                String winner = Game.checkWinner();
                result = winner;
                if (result != '') {
                  gameOver = true;
                }
              }
            },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(5, 1, 45, 1),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            Player.playerO.contains(index)
                ? 'O'
                : Player.playerX.contains(index)
                    ? 'X'
                    : '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Player.playerX.contains(index)
                      ? Colors.blue
                      : Colors.pink,
                ),
          ),
        ),
      ),
    );
  }
}
