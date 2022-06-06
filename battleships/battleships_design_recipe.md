# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a player
So that I can prepare for the game
I would like to place a ship in a board location

As a player
So that I can play a more interesting game
I would like to have a range of ship sizes to choose from

As a player
So the game is more fun to play
I would like a nice command line interface that lets me enter ship positions and
shots using commands (rather than using IRB to interact with objects)

As a player
So that I can create a layout of ships to outwit my opponent
I would like to be able to choose the directions my ships face in

As a player
So that I can have a coherent game
I would like ships to be constrained to be on the board

As a player
So that I can have a coherent game
I would like ships to be constrained not to overlap

As a player
So that I can win the game
I would like to be able to fire at my opponent's board

As a player
So that I can refine my strategy
I would like to know when I have sunk an opponent's ship

As a player
So that I know when to finish playing
I would like to know when I have won or lost

As a player
So that I can consider my next shot
I would like to be able to see my hits and misses so far

As a player
So that I can play against a human opponent
I would like to play a two-player game



## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

# Ship class


```

## 3. Integration test examples

_Make a list of examples of how the class will behave in different situations._

```ruby

# suite of ships get added to unplaced ship array at the start of the game DONE

# Game.ship_at returns true if there is a ship present 

# Game.place_ship updates the state of the correct ship's orientation, x axis and y axis DONE

# Game.place_ship works if some ships have the same length DONE

# Game.place_ship updates spaces_occupied

#Game.place_ship throws error if ship is placed in an invalid location


```
## 4. unit test examples

```` ruby

###Ship

  it "constructs" do
    ship = Ship.new(2)
    expect(ship.length).to eq 2
  end

### Game

  it "constructs" do
    ship_1 = double :ship
    ship_2 = double :ship
    ship_3 = double :ship
    ship_4 = double :ship
    ship_5 = double :ship
    game = Game.new(10, 10, ship_1, ship_2, ship_3, ship_4, ship_5)
    expect(game.unplaced_ships).to eq [ship_1, ship_2, ship_3, ship_4, ship_5]
  end

 

# Game.place_ship works if some ships have the same length

### user_interface

# run gets to the end of the sequence displaying the correct things (DONE ALREADY)



````

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

