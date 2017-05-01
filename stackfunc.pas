unit stackfunc;

interface

uses windows,MainUnit,System.SysUtils,mazefunc;


  Type
    Stack = record
    Data : Array[0..MAX-1] of sPos;
    Top : integer;
  end;

procedure Init(var p : Stack);
procedure Push(var p : Stack; data : sPos);

function Is_full(var p : Stack):boolean;
function Is_empty(var p : Stack):boolean;
function Pop(var p : Stack):sPOS;

implementation

procedure Init(var p: Stack);
begin
 p.top := -1;
end;

procedure Push(var p : Stack; Data : sPos);
begin
 if Is_full(p) = True then begin
  Messagebox(0,'Stack FULL !','ERROR',MB_OK+MB_ICONERROR);
 End
 Else begin
   Inc(p.top);
   p.Data[p.Top].x := Data.x;
   p.Data[p.Top].y := Data.y;
 End;
end;

function Is_Full(var p : Stack):boolean;
begin
 result := False;
 if p.top = MAX-1 then result := True;
end;

function Is_Empty(var p : Stack):boolean;
begin
 result := False;
 if p.top = -1 then result := True;
end;

function PoP(var p : Stack):sPOS;
begin
 if Is_Empty(p) = True then begin
   Messagebox(0,'Stack is empty !','ERROR',MB_OK+MB_ICONERROR);
   Exit;
 end;
 dec(p.Top);
 Result := p.data[p.Top+1];
// dec(p.Top);
end;

end.
