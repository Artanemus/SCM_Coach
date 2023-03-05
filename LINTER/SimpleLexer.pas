{ Implements a simpe lexer class. }
unit SimpleLexer;

interface

uses Classes, Sysutils, Types, dialogs;

type

  ESimpleLexerFinished = class(Exception) end;

  TProcTableProc = procedure of object;

  // A very simple lexer that can handle numbers, words, symbols - no comment handling
  TSimpleLexer = class(TObject)
  private
    FLineNo: Integer;
    Run: Integer;
    fOffset: Integer;
    fRunOffset: Integer; // helper for fOffset
    fTokenPos: Integer;
    pSource: PChar;
    fProcTable: array[#0..#255] of TProcTableProc;
    fUseSimpleStrings: Boolean;
    fIgnoreSpaces: Boolean;
    procedure MakeMethodTables;
    procedure IdentProc;
    procedure NewLineProc;
    procedure NullProc;
    procedure NumberProc;
    procedure SpaceProc;
    procedure SymbolProc;
    procedure UnknownProc;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Feed(const S: string);
    procedure Next;
    function GetToken: string;
    function GetLineNo: Integer;
    function GetOffset: Integer;

    property IgnoreSpaces: boolean read fIgnoreSpaces write fIgnoreSpaces;
    property UseSimpleStrings: boolean read fUseSimpleStrings write fUseSimpleStrings;
  end;

implementation

{ TSimpleLexer }

constructor TSimpleLexer.Create;
begin
  makeMethodTables;
  fUseSimpleStrings := false;
  fIgnoreSpaces := false;
end;

destructor TSimpleLexer.Destroy;
begin
  inherited;
end;

procedure TSimpleLexer.Feed(const S: string);
begin
  Run := 0;
  FLineNo := 1;
  FOffset := 1;
  pSource := PChar(S);
end;

procedure TSimpleLexer.Next;
begin
  fTokenPos := Run;
  foffset := Run - frunOffset + 1;
  fProcTable[pSource[Run]];
end;

function TSimpleLexer.GetToken: string;
begin
  SetString(Result, (pSource + fTokenPos), Run - fTokenPos);
end;

function TSimpleLexer.GetLineNo: Integer;
begin
  Result := FLineNo;
end;

function TSimpleLexer.GetOffset: Integer;
begin
  Result := foffset;
end;

procedure TSimpleLexer.MakeMethodTables;
var
  I: Char;
begin
  for I := #0 to #255 do
    case I of
      '@', '&', '}', '{', ':', ',', ']', '[', '*',
        '^', ')', '(', ';', '/', '=', '-', '+', '#', '>', '<', '$',
        '.', '"', #39:
        fProcTable[I] := SymbolProc;
      #13, #10: fProcTable[I] := NewLineProc;
      'A'..'Z', 'a'..'z', '_': fProcTable[I] := IdentProc;
      #0: fProcTable[I] := NullProc;
      '0'..'9': fProcTable[I] := NumberProc;
      #1..#9, #11, #12, #14..#32: fProcTable[I] := SpaceProc;
    else
      fProcTable[I] := UnknownProc;
    end;
end;

procedure TSimpleLexer.UnknownProc;
begin
  inc(run);
end;

procedure TSimpleLexer.SymbolProc;
begin
  if fUseSimpleStrings then
  begin
    if pSource[run] = '"' then
    begin
      Inc(run);
      while pSource[run] <> '"' do
      begin
        Inc(run);
        if pSource[run] = #0 then
        begin
          NullProc;
        end;
      end;
    end;
    Inc(run);
  end
  else
    inc(run);
end;

procedure TSimpleLexer.IdentProc;
begin
  while pSource[Run] in ['_', 'A'..'Z', 'a'..'z', '0'..'9'] do
    Inc(run);
end;

procedure TSimpleLexer.NumberProc;
begin
  while pSource[run] in ['0'..'9'] do
    inc(run);
end;

procedure TSimpleLexer.SpaceProc;
begin
  while pSource[run] in [#1..#9, #11, #12, #14..#32] do
    inc(run);
  if fIgnoreSpaces then Next;
end;

procedure TSimpleLexer.NewLineProc;
begin
  inc(FLineNo);
  inc(run);
  case pSource[run - 1] of
    #13:
      if pSource[run] = #10 then inc(run);
  end;
  foffset := 1;
  fRunOffset := run;
end;

procedure TSimpleLexer.NullProc;
begin
  raise ESimpleLexerFinished.Create('');
end;

end.
