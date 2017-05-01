unit mazefunc;

interface

uses windows,sysutils;
const
MAX = 400;
MAZESIZE = 10;
ROAD = 0;
WALL = 1;
VISITED = 2;
BACKTRACKED = 3;

  Type
    sPos = record
    x : ShortInt;
    y : ShortInt;
  end;

var

  Maze: Array[0..9,0..9] of integer;

  offset: Array[0..3,0..1] of integer
         = ((-1,0),
            (0,1),
            (1,0),
            (0,-1));


  orgMaze: Array[0..9,0..9] of integer
          = ((0,1,1,1,1,1,1,1,1,0),
            (0,0,0,0,0,1,0,1,1,0),
            (1,0,1,1,1,0,0,0,0,0),
            (1,0,0,0,0,0,1,0,1,1),
            (1,0,1,1,0,1,1,1,1,1),
            (1,0,1,1,0,0,1,0,1,1),
            (1,0,1,0,0,1,1,0,0,0),
            (1,0,1,0,1,0,0,0,1,0),
            (1,1,1,0,1,0,1,1,1,0),
            (1,1,0,0,0,0,1,1,1,0));

Procedure mazeCopy();
procedure getmazebytextfile();

Function movable(var Position : sPOS; var dir : integer): Boolean;
Function moveto(var Position : sPOS; var dir : integer): sPOS;

implementation

Procedure mazeCopy();
var
 i : integer;
 j : integer;
begin
 for j := 0 to mazesize-1 do begin
   for i := 0 to mazesize-1 do begin
    maze[i,j] := orgmaze[i,j];
   end;
 end;
end;

procedure getmazebytextfile();
var
tmpstr : string;
myfile : textfile;
i,j : integer;
begin
AssignFile(myfile,'test.txt');
Reset(myfile);
i := 0;
j := 0;
while not Eof(myfile) do begin
  Readln(myfile,tmpstr);
   while POS(' ',tmpstr) <> 0 do begin
    tmpstr := copy(tmpstr,POS(' ',tmpstr)-2,length(tmpstr));
    orgmaze[i,j] := strtoint(Copy(tmpstr,1,POS(' ',tmpstr)-1));
    inc(j);
    tmpstr := copy(tmpstr,POS(' ',tmpstr)+1,length(tmpstr));
   end;
   inc(i);
   j := 0;
end;
i := 0;
Messagebox(0,'미로 읽기 완료','OK',MB_OK+MB_ICONINFORMATION);
end;

Function movable(var Position : sPOS; var dir : integer): Boolean;
var
 next : sPOS;
begin
 result := False;
 next.x := Position.x + offset[dir,0];
 next.y := Position.y + offset[dir,1];
 if (next.x >= 0) and
 (next.x <= Mazesize-1) and
 (next.y >= 0) and
 (next.y <= Mazesize-1) and
 (maze[next.x,next.y] = ROAD)
 then begin
  result := True;
 end;
end;

Function moveto(var Position : sPOS; var dir : integer): sPOS;
var
 next : sPOS;
begin
 next.x := Position.x + offset[dir,0];
 next.y := Position.y + offset[dir,1];
 result := next;
end;

end.

