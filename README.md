# Toy Robot Simulator

## Description:
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units * 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam aroung the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however, further valid movement commands must still be allowed.

## Command should follow format as listed:
- PLACE X,Y,F
- MOVE
- LEFT
- RIGHT

## Sample Input and Output
###a)
- PLACE 0,0,NORTH
- MOVE
- REPORT
- Output: 0,1,NORTH

###b)
- PLACE 0,0,NORTH
- LEFT
- REPORT
- Output: 0,0,WEST

###c)
- PLACE 1,2,EAST
- MOVE
- MOVE
- LEFT
- MOVE
- REPORT
- Output: 3,3,NORTH

## Usage
The main file in the folder 'lib' is the entrance of program. Command 'ruby main.rb' can start the toy robot simulator.

## Screenshot
![screenshot](https://github.com/YepengFan/toy_robot_simulator/blob/master/Screen%20Shot.png)
