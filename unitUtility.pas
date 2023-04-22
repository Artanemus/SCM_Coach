unit unitUtility;

interface
uses
  System.SysUtils, System.Variants,  System.Classes, FireDAC.Comp.Client;

  function CnvVarToInt(v: variant): integer;
  function GetHRTypeStr(AHRTypeID: integer; AConnection: TFDConnection): string;

implementation

function CnvVarToInt(v: variant): integer;
var
  i, Code: integer;
begin
  i := 0;
  // Exception class EVariantTypeCastError with message
  // 'Could not convert variant of type (Null) into type (Integer)'.
  if VarIsNull(v) then
    i := 0
  else
  begin
    if VarIsStr(v) then
    begin
      System.Val(v, Code, i);
      if Code <> 0 then // on error
        i := 0;
    end
    else
      i := v; // Should work!
  end;
  result := i;
end;

function GetHRTypeStr(AHRTypeID: integer; AConnection: TFDConnection): string;
var
  SQL: string;
begin
  result := '';
  if Assigned(AConnection) and AConnection.Connected then
  begin
    // Get string for captions
    SQL := 'SELECT Caption FROM [SCM_Coach].[dbo].[HRType] WHERE HRTypeID = :id';
    // returns variant
    result := AConnection.ExecSQLScalar(SQL, [AHRTypeID]);
  end;
end;
end.
