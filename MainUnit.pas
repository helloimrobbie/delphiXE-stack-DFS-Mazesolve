unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    panel1: TPanel;
    Button2: TButton;
    ListBox1: TListBox;
    Button3: TButton;
    Button4: TButton;
    ListBox2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses stackfunc,Drawfunc,mazefunc;


var
 ss : stack;
 scur : sPOS; //������ġ ���� (����ü sPOS x.y )
 sforwarded : boolean; //���� ���� Ȯ��
 sdir : integer;
procedure TForm1.Button1Click(Sender: TObject);
begin
  mazecopy;
  DrawmazeUpdate(panel1,10,10,40);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 s : Stack;
 cur : sPOS; //������ġ ���� (����ü sPOS x.y )
 forwarded : boolean; //���� ���� Ȯ��
 dir : integer;
begin
 listbox1.Clear;
 Listbox2.Clear;
 Init(s);
 cur.x := 0; //������ġx
 cur.y := 0; //������ġy
 maze[cur.y,cur.x] := 0; //������ġ
 maze[Mazesize-1,Mazesize-1] := 0; //����ġ

 listbox1.Items.Add('[������] ('+ inttostr(cur.y) + ',' + inttostr(cur.x) + ')');  //������ ���
 while True do begin
   maze[cur.x,cur.y] := VISITED; //�����±� VISTIED ǥ��
   if (cur.x = Mazesize-1) and (cur.y = Mazesize-1) then begin
     listbox1.Items.Add('[������] ('+ inttostr(cur.y) + ',' + inttostr(cur.x) + ')');
     push(s,cur);
     cur := moveto(cur,dir);
     MessageBox(0,'�� ã�� �Ϸ� !','Success',MB_OK+MB_ICONINFORMATION);
     break;
   end;

   forwarded := False;

    for dir := 0 to 3 do begin //�� �� �� �� ��
     if movable(cur,dir) = TRUE then begin
        push(s,cur);  //���� �� ���� ��ġ �߰�
        cur := moveto(cur,dir); //���� ��ġ�� �̵�
        Listbox1.Items.Add('(' + inttostr(cur.y) + ',' + inttostr(cur.x) + ')');    //������ġ�� �Է�
        forwarded := TRUE;
        break;
      end;
    end;

    if forwarded = FALSE then begin
     maze[cur.x,cur.y] := BACKTRACKED;
     if is_empty(s) = TRUE then begin
     Messagebox(0,'���� �̷ο� ���� ���� �����ϴ�.' + #13#10 + #13#10 +'�̷θ� ���� �մϴ� !','ERROR',MB_OK+MB_ICONERROR);
     mazecopy();
     DrawmazeUpdate(panel1,10,10,40);
     break;
     end;
     cur := pop(s);
    end;
 end;
  UpdateStackList(Listbox2,s);
  DrawmazeUpdate(panel1,10,10,40);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin

   maze[scur.x,scur.y] := VISITED;
   if (scur.x = Mazesize-1) and (scur.y = Mazesize-1) then begin
     listbox1.Items.Add('[������] ('+ inttostr(scur.y) + ',' + inttostr(scur.x) + ')');
     push(ss,scur);
     scur := moveto(scur,sdir);
     button3.Enabled := False;
     UpdateStackList(Listbox2,ss);
     DrawmazeUpdate(panel1,10,10,40);
     Exit;
   end;

   sforwarded := False;

   while True do begin
    for sdir := 0 to 3 do begin
     if movable(scur,sdir) = TRUE then begin
        listbox1.Items.Add('('+ inttostr(scur.y) + ',' + inttostr(scur.x) + ')');
        push(ss,scur);
        scur := moveto(scur,sdir);
        sforwarded := TRUE;
        break;
      end;
    end;

    if sforwarded = FALSE then begin
     maze[scur.x,scur.y] := BACKTRACKED;
     if is_empty(ss) = TRUE then begin
     Messagebox(0,'���� �̷ο� ���� ���� �����ϴ�.' + #13#10 + #13#10 +'�̷θ� ���� �մϴ� !','ERROR',MB_OK+MB_ICONERROR);
     mazecopy();
     DrawmazeUpdate(panel1,10,10,40);
     end;
     scur := pop(ss);
    end;
    UpdateStackList(Listbox2,ss);
    DrawmazeUpdate(panel1,10,10,40);
    Exit;
   end;
 end;


procedure TForm1.Button4Click(Sender: TObject);
begin
 clearpanel(panel1);
 Init(ss);
 scur.x := 0; //������ġx
 scur.y := 0; //������ġy
 maze[scur.y,scur.x] := 0; //������ġ
 maze[Mazesize-1,Mazesize-1] := 0; //����ġ
 listbox1.Clear;
 Listbox2.Clear;
 button3.Enabled := True;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
getmazebytextfile();
end;

end.
