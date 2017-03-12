{@author Vahid Mavaji
 @version 1.0}
program _8queens;
const
    n= 8;
var
    col: array[1..n] of integer;
    c: integer;

function promise(i: integer): boolean;
var
    k: integer;
    switch: boolean;
begin
    k := 1;
    switch := true;
    while( (k < i) and (switch = true) ) do
    begin
        if( (col[i] = col[k]) or (abs(col[i] - col[k]) = abs(i - k) ) ) then switch := false;
        k := k + 1;
    end;
    promise := switch;
end;

procedure queens(i: integer);
var
    j, k: integer;
begin
    if( promise(i) = true ) then
    begin
        if( i = n ) then
        begin
            write('Answer Number (',c,') is: ');
            c := c + 1;
            for k:=1 to n do write('(', k, ',' , col[k],') ');
            writeln;
        end
        else
            for j:=1 to n do
            begin
                col[i + 1] := j;
                queens(i + 1);
            end;
    end;
end;

begin
    c := 1;
    queens(0);
end.