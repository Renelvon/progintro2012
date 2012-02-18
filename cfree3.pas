(* Last edit: 18-Feb-2012
   Author   : Nick Korasidis
   
   Generator of maximal conflict-free strings.
   Input : d = number of avalable distinct characters. 1 <= d <= 26
   Output: A maximal conflict-free string with d distinct characters.

   Time complexity : O(2^d).
   Space complexity: O(d) <--- WHY?
*)
program cfree3 (input, output);
var d : integer;

procedure printBT(d : integer);
begin
    if d > 0 then begin
        printBT(d - 1);
        write(chr(ord('a') + d - 1));
        printBT(d - 1);
    end
end;

begin
    readln(d);
    
    (* Just calculate and print the correct answer on-the-fly! *)
    printBT(d);
    writeln;

    (* Where did the tree go? ... *)
end.
