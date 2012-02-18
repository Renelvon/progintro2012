program cformati2 (input, output);
const default = ' ';
var i, c, d, N: integer;
    ch ,dummy : char;
    flag, flag2: boolean;
    s: array[1..67108864] of char; 
begin
    readln(d);

    N := 1;
    for i := 1 to d do
        N := N * 2;
    N := N - 1;

    for i := 1 to N do
        s[i] := default;

    for c := 1 to d do begin
        ch := chr(ord('a') + c - 1);
        flag := true;
        for i := 1 to N do
            if s[i] = default then
                if flag then begin
                    s[i] := ch;
                    flag := false
                end
                else
                    flag := true;
(*        read(dummy); *)
        flag2 := false;
        for i := 1 to N do begin
            if s[i] = ch then begin
                write(ch);
                s[i] := '|'
            end
            else if s[i] = default then
                write(default)
            else if s[i] = '|' then begin
                write('|');
                flag := not flag;
                s[i] := '-';
            end
            else if flag then 
                write('-')
            else
                write(' ')
        end;
        writeln
    end
end.
