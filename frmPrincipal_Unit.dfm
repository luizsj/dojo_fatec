object frmPrincipal: TfrmPrincipal
  Left = 621
  Top = 160
  Width = 800
  Height = 560
  BorderWidth = 10
  Caption = 'frmPrincipal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 764
    Height = 502
    ActivePage = shtSorteio
    Align = alClient
    TabOrder = 0
    object shtTurmas: TTabSheet
      BorderWidth = 10
      Caption = 'Cadastro de Turmas'
      OnShow = shtTurmasShow
      object lblAlunosdaTurma: TLabel
        Left = 175
        Top = 3
        Width = 106
        Height = 20
        AutoSize = False
        Caption = 'Alunos da Turma'
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object imgCad: TImage
        Left = 570
        Top = 35
        Width = 166
        Height = 151
        Center = True
        Proportional = True
      end
      object lblCadturma: TLabel
        Left = 281
        Top = 3
        Width = 106
        Height = 20
        AutoSize = False
        Caption = '----'
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object Panel1: TPanel
        Left = 0
        Top = 5
        Width = 156
        Height = 301
        BorderWidth = 5
        Color = clSkyBlue
        TabOrder = 0
        object lblTurmas: TLabel
          Left = 15
          Top = 8
          Width = 62
          Height = 17
          AutoSize = False
          Caption = 'Turmas'
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Panel2: TPanel
          Left = 6
          Top = 230
          Width = 144
          Height = 65
          Align = alBottom
          BorderWidth = 5
          TabOrder = 0
          object Label1: TLabel
            Left = 6
            Top = 6
            Width = 132
            Height = 13
            Align = alTop
            Caption = 'Nova Turma: '
          end
          object editNovaTurma: TEdit
            Left = 10
            Top = 25
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
            Text = 'EDITNOVATURMA'
            OnKeyUp = editNovaTurmaKeyUp
          end
        end
        object lstTurmas: TListBox
          Left = 15
          Top = 35
          Width = 126
          Height = 181
          ItemHeight = 13
          TabOrder = 1
          OnClick = lstTurmasClick
        end
      end
      object gridCadAlunos: TStringGrid
        Left = 175
        Top = 25
        Width = 386
        Height = 341
        Color = clWhite
        ColCount = 2
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
        TabOrder = 1
        OnExit = gridCadAlunosExit
        OnKeyUp = gridCadAlunosKeyUp
        OnSetEditText = gridCadAlunosSetEditText
      end
      object btnSalvar: TBitBtn
        Left = 435
        Top = 0
        Width = 91
        Height = 21
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
    end
    object shtSorteio: TTabSheet
      BorderWidth = 10
      Caption = 'Sorteio'
      ImageIndex = 1
      object imgAluno01: TImage
        Left = 515
        Top = 30
        Width = 200
        Height = 180
        Center = True
        Proportional = True
      end
      object Label2: TLabel
        Left = 445
        Top = 50
        Width = 61
        Height = 61
        Alignment = taCenter
        AutoSize = False
        Caption = '1'#187
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        OnClick = Label2Click
      end
      object Label3: TLabel
        Left = 445
        Top = 275
        Width = 61
        Height = 61
        Alignment = taCenter
        AutoSize = False
        Caption = '2'#187
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        OnClick = Label3Click
      end
      object imgAluno02: TImage
        Left = 515
        Top = 255
        Width = 200
        Height = 180
        Center = True
        Proportional = True
      end
      object lblAluno01: TLabel
        Left = 550
        Top = 31
        Width = 130
        Height = 30
        Alignment = taCenter
        AutoSize = False
        Caption = '000000'
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblNome01: TLabel
        Left = 515
        Top = 8
        Width = 201
        Height = 20
        AutoSize = False
        Caption = '---'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblNome02: TLabel
        Left = 515
        Top = 234
        Width = 201
        Height = 20
        AutoSize = False
        Caption = '----'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblAluno02: TLabel
        Left = 550
        Top = 257
        Width = 130
        Height = 30
        Alignment = taCenter
        AutoSize = False
        Caption = '000000'
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object cmbTurmas: TComboBox
        Left = 0
        Top = 5
        Width = 145
        Height = 30
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 22
        ParentFont = False
        TabOrder = 0
        OnChange = cmbTurmasChange
      end
      object gridSorteio: TStringGrid
        Left = 0
        Top = 40
        Width = 426
        Height = 391
        Color = clWhite
        ColCount = 3
        DefaultRowHeight = 20
        FixedCols = 2
        RowCount = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
        ParentFont = False
        TabOrder = 1
        RowHeights = (
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20)
      end
      object ListBox1: TListBox
        Left = 325
        Top = 55
        Width = 76
        Height = 366
        ItemHeight = 13
        Sorted = True
        TabOrder = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Par'#226'metros Sorteio'
      ImageIndex = 2
      object Label4: TLabel
        Left = 55
        Top = 40
        Width = 96
        Height = 30
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saltos:'
        Layout = tlCenter
      end
    end
  end
end
