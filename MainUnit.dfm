object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Maze Algorithm'
  ClientHeight = 534
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 448
    Top = 8
    Width = 78
    Height = 13
    Caption = #54788#51116' '#48120#47196' '#51652#54665
  end
  object Label2: TLabel
    Left = 574
    Top = 8
    Width = 90
    Height = 13
    Caption = #54788#51116' '#49828#53469' '#45936#51060#53552
  end
  object Button1: TButton
    Left = 8
    Top = 439
    Width = 425
    Height = 25
    Caption = 'Create Maze !'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 425
    Height = 425
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 470
    Width = 425
    Height = 25
    Caption = 'Find Path !'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 448
    Top = 32
    Width = 120
    Height = 401
    ItemHeight = 13
    TabOrder = 3
  end
  object Button3: TButton
    Left = 8
    Top = 501
    Width = 425
    Height = 25
    Caption = 'Step Find Path !'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 448
    Top = 439
    Width = 247
    Height = 56
    Caption = #52884#48260#49828' '#52488#44592#54868
    TabOrder = 5
    OnClick = Button4Click
  end
  object ListBox2: TListBox
    Left = 574
    Top = 32
    Width = 121
    Height = 401
    ItemHeight = 13
    TabOrder = 6
  end
  object Button5: TButton
    Left = 448
    Top = 501
    Width = 247
    Height = 25
    Caption = #48120#47196#51069#44592
    TabOrder = 7
    OnClick = Button5Click
  end
end
