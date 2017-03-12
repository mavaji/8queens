{@author Vahid Mavaji
 @version 1.0}
program _8queens;
const
    columnCount= 8;
var
    columns: array[1..columnCount] of integer;
    answerCount: integer;

function promise(i: integer): boolean;
var
    k: integer;
    result: boolean;
begin
    k := 1;
    result := true;

    while( (k < i) and (result = true) ) do
    begin
        if( (columns[i] = columns[k]) or (abs(columns[i] - columns[k]) = abs(i - k) ) ) then result := false;
        k := k + 1;
    end;

    promise := result;
end;

procedure queens(i: integer);
var
    j, k: integer;
begin
    if( promise(i) = true ) then
    begin
        if( i = columnCount ) then
        begin
            write('Answer Number [',answerCount,'] is: ');
            answerCount := answerCount + 1;
            for k:=1 to columnCount do write('(', k, ',' , columns[k],') ');
            writeln;
        end
        else
            for j:=1 to columnCount do
            begin
                columns[i + 1] := j;
                queens(i + 1);
            end;
    end;
end;

begin
    answerCount := 1;
    queens(0);
end.