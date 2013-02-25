unit dojo_turmas;

interface
uses stdctrls, sysutils, filectrl, grids;

type TPastas = Array[0..2] of String;
type TListaAlunos = Array of Array of String;


procedure listar_turmas(lstfile: TListBox; cmbTurmas: TCombobox; var pastas: TPastas);
procedure NovaTurma(nome: string; pastas: TPastas);
procedure listaCadAlunos(turma: String; grid: TStringGrid; cadastro: boolean; var pastas: Tpastas);
procedure SalvaTurma(pastas: Tpastas; turma: String; grid: TStringGrid);

const pasta_turmas = string('turmas');

implementation
uses frmPrincipal_Unit;

procedure SalvaTurma(pastas: Tpastas; turma: String; grid: TStringGrid);
var f: textfile;
    i: integer;
    linha, arquivo: string;
begin
  arquivo := pastas[1] + '\' + turma + '.txt';
  assignfile(f, arquivo);
  rewrite(f);
  for i := 1 to grid.rowcount -1  do
    begin
      if grid.cells[0, i] <> '' then
        begin
          linha := grid.cells[0, i] + chr(9) + uppercase(grid.cells[1, i]);
          writeln(f, linha);
        end;
    end;
  closefile(f);
end;

procedure listaCadAlunos(turma: String; grid: TStringGrid; cadastro: boolean; var pastas: Tpastas);
var linha, postab: integer;
    f: textfile;
    linarq, ra, nome: string;
begin
  assignfile(f, pastas[1] + '\' + turma + '.txt');
  reset(f);
  grid.rowcount := 2;
  while not eof(f) do
    begin
      linha := grid.rowcount - 1;

      readln(f, linarq);
      postab := pos(chr(9), linarq);
      ra := copy(linarq, 1, postab -1);
      nome := copy(linarq, postab+1, length(linarq));

      grid.cells[0, linha] := ra;
      grid.cells[1, linha] := nome;
      if not cadastro then
        grid.cells[2, linha] := '';
      grid.rowcount := grid.rowcount + 1;
    end;
  //pastas 2 := fotos da turma
  closefile(f);
  pastas[2] :=  Pastas[1] + '\' + turma + '_fotos';
end;

procedure NovaTurma(nome: string; pastas: TPastas);
begin
  nome := pastas[0] + '\' + nome + '.txt';
  if not fileexists(nome) then
    fileCreate(nome);
  nome := pastas[0] + '\' + nome + '\fotos';
  if not DirectoryExists(nome) then
    CreateDir(nome);
end;

procedure listar_turmas(lstfile: TListBox; cmbTurmas: TCombobox; var pastas: TPastas);
var lista: tfilelistbox;
    i: integer; turma: string;
begin
  //pastas 0: programa; 1: lista de turmas
  if pastas[1] = '' then
    pastas[1] := getCurrentDir + '\turmas' ;

  if not DirectoryExists(pastas[1]) then
    CreateDir(pastas[1]);

  lista := TfileListBox.Create(frmPrincipal);
  lista.Parent := frmPrincipal;
  lista.Directory := pastas[1];
  lista.Update;

  cmbTurmas.items.clear;
  for i := 0 to lista.items.count -1 do
    begin
      turma := lista.Items[i];
      turma := copy(turma, 1, length(turma) - 4);
      cmbTurmas.items.add(turma);
      lstfile.items[i] := turma;
    end;
  if cmbTurmas.items.count > 0 then
    cmbTurmas.itemindex := 0;
  lista.Destroy;
end;

end.
