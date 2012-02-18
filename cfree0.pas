(* Last edit: 18-Feb-2012
   Author   : Nick Korasidis
   
   Generator of maximal conflict-free strings.
   Input : d = number of avalable distinct characters. 1 <= d <= 26
   Output: A maximal conflict-free string with d distinct characters.

   Time complexity : O(d * 2^d).
   Space complexity: O(2^d).
*)
program cfree0 (input, output);
var i, c, d, N: integer;
    ch : char;
    flag: boolean;
    s: array[1..67108864] of char; 
begin
    readln(d);

    (* Calculate N = 2^d - 1. *)
    N := 1;
    for i := 1 to d do
        N := N * 2;
    N := N - 1;

    (* Initialize table with dashes. *)
    for i := 1 to N do
        s[i] := '-';

    (* Iterate over each available character... *)
    for c := 1 to d do begin
        ch := chr(ord('a') + c - 1); 

        (* Scan the whole table. Ignore table entries which are not dashes.
           Alternate between
            a) replacing a dash with the current character, ch.
            b) skipping the dash. *)
        flag := true;
        for i := 1 to N do
            if s[i] = '-' then
                if flag then begin
                    s[i] := ch;
                    flag := false
                end
                else
                    flag := true;
    end;

    for i := 1 to N do
        write(s[i]);
    writeln
end.
