# connect-four
## Population

When game starts it initiates a board with nil valies for each board coordinate. So the board looks like this:
```ruby
[0,5,nil][1,5,nil][2,5,nil][3,5,nil][4,5,nil][5,5,nil][6,5,nil]
[0,4,nil][1,4,nil][2,4,nil][3,4,nil][4,4,nil][5,4,nil][6,4,nil]
[0,3,nil][1,3,nil][2,3,nil][3,3,nil][4,3,nil][5,3,nil][6,3,nil]
[0,2,nil][1,2,nil][2,2,nil][3,2,nil][4,2,nil][5,2,nil][6,2,nil]
[0,1,nil][1,1,nil][2,1,nil][3,1,nil][4,1,nil][5,1,nil][6,1,nil]
[0,0,nil][1,0,nil][2,0,nil][3,0,nil][4,0,nil][5,0,nil][6,0,nil]
```
On each turn we pass a number of column to place a player color there. The ball will be place on the top of the existing balls.

For example after four turns with the same value of column, the board will look like this:
 ```ruby
game.move(3, "red")
game.move(3, "yellow")
game.move(3, "red")
game.move(1, "yellow")
 ```
 ```ruby
[0,5,nil][1,5,nil][2,5,nil][3,5,nil][4,5,nil][5,5,nil][6,5,nil]
[0,4,nil][1,4,nil][2,4,nil][3,4,nil][4,4,nil][5,4,nil][6,4,nil]
[0,3,nil][1,3,nil][2,3,nil][3,3,nil][4,3,nil][5,3,nil][6,3,nil]
[0,2,nil][1,2,nil][2,2,nil][3,2,"red"][4,2,nil][5,2,nil][6,2,nil]
[0,1,nil][1,1,nil][2,1,nil][3,1,"yellow"][4,1,nil][5,1,nil][6,1,nil]
[0,0,nil][1,0,"yellow"][2,0,nil][3,0,"red"][4,0,nil][5,0,nil][6,0,nil]
```

During each turn player stores the coordinates of his balls, to use them for win check:
```ruby
red_player_balls = [[3,0], [3,2]]
```

## Win checks
Starting from the 4th turn of the same player, the game starts to calculate the amount of adjacent balls.
For all cases the starting point is last turn ball. After that, game calculates how many there are balls to the left and to the right of that last turn ball (horizontal case). If the next ball is nil, calculation stops in that direction. So in the end, if the sum of left and right resultso is 3 (we ignore the last turn ball as it is the 4th one) game is over and that player is a winner. For vertical and diagonal(left and right angled) the flow is the same, but we go with not left and right direction, but with the up and down and diagonal one.

Example:
current board

 ```ruby
[0,5,nil][1,5,nil][2,5,nil][3,5,nil][4,5,nil][5,5,nil][6,5,nil]
[0,4,nil][1,4,"red"][2,4,nil][3,4,nil][4,4,nil][5,4,nil][6,4,nil]
[0,3,nil][1,3,"red"][2,3,"red"][3,3,nil][4,3,nil][5,3,nil][6,3,nil]
[0,2,nil][1,2,"yellow"][2,2,"yellow"][3,2,nil][4,2,nil][5,2,nil][6,2,nil]
[0,1,nil][1,1,"yellow"][2,1,"red"][3,1,"yellow"][4,1,"red"][5,1,nil][6,1,nil]
[0,0,nil][1,0,"yellow"][2,0,"yellow"][3,0,"red"][4,0,"yellow"][5,0,nil][6,0,nil]
```
let's make a move
 ```ruby
game.move(3, "red")
```
our board now is:
 ```ruby
[0,5,nil][1,5,nil][2,5,nil][3,5,nil][4,5,nil][5,5,nil][6,5,nil]
[0,4,nil][1,4,"red"][2,4,nil][3,4,nil][4,4,nil][5,4,nil][6,4,nil]
[0,3,nil][1,3,"red"][2,3,"red"][3,3,nil][4,3,nil][5,3,nil][6,3,nil]
[0,2,nil][1,2,"yellow"][2,2,"yellow"][3,2,"red"][4,2,nil][5,2,nil][6,2,nil]
[0,1,nil][1,1,"yellow"][2,1,"red"][3,1,"red"][4,1,"red"][5,1,nil][6,1,nil]
[0,0,nil][1,0,"yellow"][2,0,"yellow"][3,0,"red"][4,0,"yellow"][5,0,nil][6,0,nil]

red_player_balls = [[1,3], [1,4], [3,0], [3,1], [4,1], [2,1], [2,3], [3,2]]
last_ball = [3,2]
horizontal_check = 0(to the left) + 0(to the right) = 0  # != 3
vertical_check = 0(to the top) + 2(to the bottom) = 2 # != 3
right_angled_diagonal_check = 0(to the top-right) + 1(to the bottom-left) = 1 # != 3
left_angled_diagonal_check = 2(to the top-left) + 1(to the bottom-right) = 3 # == 3 !!!! you are a winner!
```
