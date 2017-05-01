unit Drawfunc;

interface


uses ExtCtrls,windows,mazefunc,StdCtrls,sysUtils,stackfunc;


type
 tmypanel = class(TPanel)
end;

Procedure UpdateStackList(Listbox : TListbox; S : Stack);
Procedure ClearPanel(panel : TPanel);
Procedure DrawMazeUpdate(panel : TPanel; Const x,y,size : integer);
Procedure DrawBox(panel : TPanel; Const x,y,size : integer; Const CompareWall:integer);
Procedure DrawgroundBox(panel : TPanel; Const x,y,mx,my:integer);
Procedure DrawLineBox(panel : TPanel; Const x,y,size : integer; Const CompareType:String);
implementation


{
 size = 40
 x,y = 10

}

Procedure UpdateStackList(Listbox : TListbox; S : Stack);
var
i : integer;
begin
listbox.Clear;
 for i := 0 to s.top do begin
  listbox.Items.add(inttostr(s.Data[i].y) + ',' + inttostr(s.Data[i].x));
 end;
end;

Procedure ClearPanel(panel : TPanel);
begin
  Tmypanel(panel).Canvas.Brush.Color := RGB(255,255,255);
  Tmypanel(panel).Canvas.FillRect(Tmypanel(panel).Canvas.ClipRect);
end;
Procedure DrawMazeUpdate(panel : TPanel; Const x,y,size : integer);
var
i : integer;
j : integer;
tmpx,tmpy : integer;
begin
tmpx := x;
tmpy := y;
Tmypanel(panel).Canvas.Brush.Color := RGB(255,255,255);
Tmypanel(panel).Canvas.FillRect(Tmypanel(panel).Canvas.ClipRect);
for i := 0 to 9 do begin
 tmpy := y + (i*size);
 for j := 0 to 9 do begin
  DrawBox(panel,x+(j*size),tmpy,size,maze[i,j]);
 end;
end;

 Drawgroundbox(panel,10,10,9+(10*size),9+(10*size));
end;
Procedure DrawBox(panel : TPanel; Const x,y,size : integer; Const CompareWall: integer);
begin
 with tmypanel(panel).Canvas do begin
   pen.Width := 2;
    if CompareWall = Wall then begin
     pen.Color := RGB(255,0,0);
     Rectangle(x,y,x+size,y+size);
     moveto(x,y);
     lineto((x-1)+size,(y-1)+size);
     moveto((x-1)+size,y);
     lineto((x-1),(y-1)+size);
    end
    else if CompareWall = VISITED then begin
     pen.Color := RGB(0,255,0);
     Rectangle(x,y,x+size,y+size);
     Ellipse(x,y,x+size,y+size);
    end
    else if CompareWall = BACKTRACKED then begin
     pen.Color := RGB(255,94,0);
     Rectangle(x,y,x+size,y+size);
     Ellipse(x,y,x+size,y+size);
    end;
 end;

end;

Procedure DrawgroundBox(panel : TPanel; Const x,y,mx,my:integer);
begin
  with Tmypanel(panel).Canvas do begin
    pen.Width := 2;
    pen.Color := RGB(0,0,0);
    moveto(x,y);
    lineto(mx,y);
    lineto(mx,my);
    lineto(x,my);
    lineto(x,y);
  end;
end;

Procedure DrawLineBox(panel : TPanel; Const x,y,size : integer; Const CompareType:String);
begin
 with Tmypanel(panel).Canvas do begin
   if CompareType = 'S' then begin
     pen.Color := RGB(255,228,0);
     Rectangle(x,y,x+size,y+size);
     moveto(x,y+size div 4);
     lineto((x-1)+size,y+size div 4);
     moveto(x,y+size div 2);
     lineto((x-1)+size,y+size div 2);
     moveto(x,y+size - (size div 4));
     lineto((x-1)+size,y+size - (size div 4));
    end
    else if CompareType = 'E' then begin
     pen.Color := RGB(0,0,255);
     Rectangle(x,y,x+size,y+size);
     moveto(x+size div 4,y);
     lineto(x+size div 4,(y-1)+size);
     moveto(x+size div 2,y);
     lineto(x+size div 2,(y-1)+size);
     moveto(x+size - (size div 4),y);
     lineto(x+size - (size div 4),(y-1)+size);
    end;
 end;
end;
end.
