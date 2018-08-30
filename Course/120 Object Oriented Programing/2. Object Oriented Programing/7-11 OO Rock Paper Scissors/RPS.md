Notice that in OO, we don't think about the game flow logic at all. It's all about organizing and modularizing the code into a cohesive structure - classes. After we come up with the initial class definitions, the final step is to orchestrate the flow of the program using objects instantiated from the classes. We won't worry about that final step yet.

Let's use the above approach and first write out a textual description of Rock, Paper and Scissors.

```
Rock, Paper, Scissors is a two-player game where each player chooses
one of three possible moves: rock, paper, or scissors. The chosen moves
will then be compared to see who wins, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the players chose the same move, then it's a tie.
```

```
Nouns: player, move, rule
Verbs: choose, compare
```

```
Player
 - choose
Move
Rule

- compare
```
