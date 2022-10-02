# delphiXE-stack-DFS-Mazesolve
maze solve

use Data Struct - STACK
use DFS(Depth First Search) algorithm
use IDE Delphi 10.1 Berlin.


How to use Function ?

1.  Drawfunc.pas

Procedure UpdateStackList(Listbox : TListbox; S : Stack);
 --> Argument ListBox & S(Stack variable). Draw Now Stack Data to ListBox
 
 
Procedure ClearPanel(panel : TPanel);
 --> Panel is Clear.(White)
 
 
 
Procedure DrawMazeUpdate(panel : TPanel; Const x,y,size : integer);
 --> TPanel.Canvas Draw Maze Status Update ! ( Wall , VISITED , BACKTRACKED )
 
 
 
Procedure DrawBox(panel : TPanel; Const x,y,size : integer; Const CompareWall:integer);
 --> TPanel.Canvas Draw Maze Object ( Wall , VISITED , BACKTRACKED )
 
 
Procedure DrawgroundBox(panel : TPanel; Const x,y,mx,my:integer);
 --> TPanel.Canvas Draw Maze Frame
 
 
 
Procedure DrawLineBox(panel : TPanel; Const x,y,size : integer; Const CompareType:String);
 --> This Project Dont user This Procedure . but is draw LineBox !!
 
 

2. mazefunc.pas

you can show 'maze' & 'orgmaze' 2D Array variable.

i used this variable (maze) to prevent the entire data from changing.
 orgmaze is mean 'original maze data' ^^
 

Procedure mazeCopy();
 --> original maze data copy to 'maze'
 
 
procedure getmazebytextfile();
 --> get text maze data by my application path/text.txt


Function movable(var Position : sPOS; var dir : integer): Boolean;
 --> Inspect the current location of the maze to see if the next location can be reached. 
 
 

Function moveto(var Position : sPOS; var dir : integer): sPOS;
 --> Move now position in maze
 
 
 
 3. stackfunc.pas
 
 
 its stack function
 
 dont use Pointer !
 
 just Array.
 
 


Thanks.
