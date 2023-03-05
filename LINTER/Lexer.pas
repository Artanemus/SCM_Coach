unit Lexer;

interface
type
  TLexer = class
  private
    FData: string;
    FTokenStart: PChar;
    FCurrPos: PChar;
    function GetCurrentToken: string;
  public
    constructor Create(const AData: string);
    function GetNextToken: Boolean;
    property CurrentToken: string read GetCurrentToken;
  end;

{ TLexer }



implementation

constructor TLexer.Create(const AData: string);
begin
  FData := AData;
  FCurrPos := PChar(FData);
end;

function TLexer.GetCurrentToken: string;
begin
  SetString(Result, FTokenStart, FCurrPos - FTokenStart);
end;

function TLexer.GetNextToken: Boolean;
var
  cp: PChar;
begin
  cp := FCurrPos; // copy to local to permit register allocation

  // skip whitespace; this test could be converted to an unsigned int
  // subtraction and compare for only a single branch
  while (cp^ > #0) and (cp^ <= #32) do
    Inc(cp);

  // using null terminater for end of file
  Result := cp^ <> #0;

  if Result then
  begin
    FTokenStart := cp;
    Inc(cp);
    while cp^ > #32 do
      Inc(cp);
  end;

  FCurrPos := cp;
end;

end.
