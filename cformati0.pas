program cformati (input, output);
const default = ' ';
var i, c, d, N: integer;
    ch ,dummy : char;
    flag: boolean;
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
        read(dummy);
        for i := 1 to N do begin
            if s[i] = ch then
                write(ch)
            else
                write(default);
        end;
        writeln
    end
end.
