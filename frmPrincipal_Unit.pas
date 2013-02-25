unit frmPrincipal_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, ExtCtrls, FileCtrl, Buttons, Jpeg;

type
  TfrmPrincipal = class(TForm)
    PageControl1: TPageControl;
    shtTurmas: TTabSheet;
    shtSorteio: TTabSheet;
    lblAlunosdaTurma: TLabel;
    Panel1: TPanel;
    lblTurmas: TLabel;
    gridCadAlunos: TStringGrid;
    Panel2: TPanel;
    Label1: TLabel;
    editNovaTurma: TEdit;
    lstTurmas: TListBox;
    imgCad: TImage;
    lblCadturma: TLabel;
    btnSalvar: TBitBtn;
    cmbTurmas: TComboBox;
    imgAluno01: TImage;
    Label2: TLabel;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    imgAluno02: TImage;
    lblAluno01: TLabel;
    gridSorteio: TStringGrid;
    ListBox1: TListBox;
    lblNome01: TLabel;
    lblNome02: TLabel;
    lblAluno02: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure shtTurmasShow(Sender: TObject);
    procedure editNovaTurmaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstTurmasClick(Sender: TObject);
    procedure gridCadAlunosSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: String);
    procedure gridCadAlunosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridCadAlunosExit(Sender: TObject);
    procedure cmbTurmasChange(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    procedure Limpar_Grid(grid: TstringGrid);
    procedure grid_adicionalinha(grid: TStringgrid);
    procedure CarregarFoto(grid: tstringgrid; img: Timage);
    procedure Inicia_Fotos_Sorteio(qual: integer);
    procedure ExibeSorteado(linha: integer; lbl, lblNome: tlabel; img: Timage);
    procedure Sortear(lbl, lblNome: Tlabel; img: Timage);
    function ContaPresentes: integer;
    procedure reinicia_Sorteados(qtpresentes: integer);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses dojo_turmas;

var pastas: Tpastas;
    sorteados: Array of integer;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  pastas[0] := getCurrentDir;
  dojo_turmas.listar_turmas(lstturmas, cmbTurmas, pastas);
end;

procedure TfrmPrincipal.shtTurmasShow(Sender: TObject);
begin
  editNovaTurma.Text := '';
  Limpar_Grid(gridCadAlunos);
  btnSalvar.Visible := false;
  if lstturmas.items.count > 0 then
    if lstturmas.itemindex = -1 then
      begin
        lstturmas.itemindex := 0;
        lstTurmasClick(Self);
      end;
end;

procedure TfrmPrincipal.Limpar_Grid(grid: TstringGrid);
var i, j: integer;
begin
  with grid do
    begin
      Cells[0, 0] := 'RA';
      Cells[1, 0] := 'NomeAluno';

      for i := 1 to rowcount -1 do
        begin
          for j := 0 to colcount -1 do
            Cells[j, i] := '';
        end;
      RowCount := 2;
      ColWidths[0] := 60;
      ColWidths[1] := 200;
      Color := clwhite;
    end;
end;

procedure TfrmPrincipal.editNovaTurmaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    begin
      editNovaTurma.Text := trim(editNovaturma.text);
      if length(editNovaTurma.text) >= 3 then
        begin
         dojo_turmas.NovaTurma(editNovaTurma.text, pastas);
          editNovaTurma.text := '';
          dojo_turmas.listar_turmas(lstturmas, cmbTurmas, pastas);
        end;
    end;
end;

procedure TfrmPrincipal.lstTurmasClick(Sender: TObject);
var turma: string;
begin
  turma := lstTurmas.items[lstTurmas.itemindex];
  if turma <>  '' then
    begin
      lblCadTurma.caption := turma;
      dojo_turmas.listaCadAlunos(turma, gridCadAlunos, true, pastas);
      gridCadAlunos.color := clwhite;
    end;
end;

procedure TfrmPrincipal.gridCadAlunosSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  btnSalvar.Visible := true;
  gridCadAlunos.Color := clyellow;
end;

procedure TfrmPrincipal.gridCadAlunosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  linhas: integer;
begin
  linhas := gridCadAlunos.RowCount;
  if key = vk_add then
    //se pressionar '+' adiciona uma linha;
    grid_adicionalinha(gridCadAlunos)
  else
    if key = vk_return then
      begin
        if gridCadAlunos.Col = 0 then gridCadAlunos.Col := 1
        else
          // ou é igual a linha-1(última) ou menor
          if gridCadAlunos.Row = linhas - 1 then
            grid_adicionalinha(gridCadAlunos)
          else
            begin
              gridCadAlunos.Row := gridCadAlunos.Row + 1;
              gridCadAlunos.Col := 0;
            end;
      end;
    CarregarFoto(gridCadAlunos, imgCad);
end;

procedure TfrmPrincipal.grid_adicionalinha(grid: TStringgrid);
begin
  grid.RowCount := grid.RowCount + 1;
  grid.Row := grid.RowCount -1;
  grid.Col := 0;
end;

procedure TfrmPrincipal.CarregarFoto(grid: tstringgrid; img: Timage);
var arqfoto: string;
begin
  arqfoto := grid.Cells[0, grid.row];
  if arqfoto <> '' then
    begin
      arqfoto := pastas[2] + '\' + arqfoto + '.jpg';
      if not fileexists(arqfoto) then
        arqfoto := pastas[0] + '\semfoto.jpg';

      img.Picture.LoadFromFile(arqfoto);
    end;
end;

procedure TfrmPrincipal.gridCadAlunosExit(Sender: TObject);
begin
  dojo_turmas.SalvaTurma(pastas, lblCadturma.Caption, gridCadAlunos);
  lstTurmasclick(self);
end;

procedure TfrmPrincipal.cmbTurmasChange(Sender: TObject);
var i: integer; turma: string;
begin
  Limpar_Grid(gridSorteio);
  gridSorteio.ColWidths[2] := 40;
  gridSorteio.cells[2, 0] := 'Pres?(S/N)';

  turma := cmbTurmas.items[cmbTurmas.itemindex];
  dojo_turmas.listaCadAlunos(turma, gridSorteio, false, pastas);
  gridSorteio.rowcount := gridSorteio.rowcount -1;

  setLength(sorteados, gridSorteio.RowCount);
  for i := 0 to gridSorteio.Rowcount do
     sorteados[i] := 0;

  Randomize();
  Inicia_Fotos_Sorteio(1);
  Inicia_Fotos_Sorteio(2);
end;

procedure TfrmPrincipal.Inicia_Fotos_Sorteio(qual: integer);
var arqsemfoto: string;
begin
  arqsemfoto := pastas[0] + '\semfoto.jpg';
  if qual = 1 then
    begin
      imgAluno01.picture.loadfromfile(arqsemfoto);
      lblAluno01.caption := '';
      lblNome01.caption := '';
    end
  else
    begin
      imgAluno02.picture.loadfromfile(arqsemfoto);
      lblAluno02.caption := '';
      lblNome02.caption :=  '';
    end;
end;

procedure TfrmPrincipal.Label2Click(Sender: TObject);
begin
  lblNome01.Visible := false;
  frmPrincipal.Repaint;
  Sortear(lblAluno01, lblNome01, imgAluno01);
  lblNome01.Visible := true;
end;

procedure TfrmPrincipal.reinicia_Sorteados(qtpresentes: integer);
var i, qtsorteados: integer;
begin
  qtsorteados := 0;
  for i := 1 to gridSorteio.Rowcount -1 do
    begin
      if sorteados[i] = i then
        qtsorteados := qtsorteados + 1;
    end;
  if qtsorteados >= qtpresentes then
    begin
      ShowMessage('Lista Completada (será reiniciada)');

      for i := 0 to gridSorteio.Rowcount do
        sorteados[i] := 0;
      
    end;
end;

procedure TfrmPrincipal.Sortear(lbl, lblnome: Tlabel; img: Timage);
var  linha, presentes: integer;
  jafoi : boolean; compresenca: string;
begin
  presentes := contapresentes();
  if (presentes > 0) then
    begin
      reinicia_sorteados(presentes);
      lbl.color := clred;
      lbl.caption := '000000';
      lbl.repaint;
      jafoi := true;
      linha := 0;
      while jafoi do
        begin
          lbl.caption := gridSorteio.cells[0, linha];
          lbl.Repaint;
          linha := random(gridSorteio.RowCount);
          compresenca := trim(gridSorteio.cells[2, linha]);
          compresenca := copy(compresenca, 1, 1);
          compresenca := uppercase(compresenca);
          if (linha = 0) or (compresenca <> 'S') then
              jafoi := true
          else
              jafoi := sorteados[linha] = linha;
          sleep(200);
        end;
      sorteados[linha] := linha;
      gridSorteio.Row := linha;
      ExibeSorteado(linha, lbl, lblNome, img);
    end;
end;

function tfrmPrincipal.ContaPresentes: integer;
var i, temp: integer;
begin
  temp := 0;
  for i := 1 to gridSorteio.rowcount -1 do
    begin
      if uppercase(gridSorteio.cells[2, i]) = 'S' then
        temp := temp + 1;
    end;
  if temp = 0 then
    ShowMessage('Marcar S para alunos presentes!');
  result := temp;
end;

procedure tfrmPrincipal.ExibeSorteado(linha: integer; lbl, lblnome: tlabel; img: Timage);
var ra: string;
    i, compr : integer;
begin
  lbl.color := clyellow;
  ra := gridSorteio.cells[0, linha];
  compr := length(ra);
  ra := stringofchar('-', 6 - compr) + ra;
  for i := 1 to 6 do
    begin
      sleep(i*200);
      lbl.Caption := copy(ra, 1, i) + stringofchar('?', compr -i);
      lbl.Repaint;
    end;
  lbl.Color := cllime;
  listbox1.items.add(ra);
  lblNome.Caption := gridSorteio.Cells[1, linha];
  carregarfoto(gridSorteio, img);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if cmbTurmas.Items.count > 0 then
          cmbTurmaschange(self);
end;

procedure TfrmPrincipal.Label3Click(Sender: TObject);
begin
  lblNome02.Visible := false;
  frmPrincipal.Repaint;
  Sortear(lblAluno02, lblNome02, imgAluno02);
  lblNome02.Visible := true;
end;

end.
