(* Last edit: 18-Feb-2012
   Author   : Nick Korasidis
   
   Generator of maximal conflict-free strings.
   Input : d = number of avalable distinct characters. 1 <= d <= 26
   Output: A maximal conflict-free string with d distinct characters.

   Time complexity : O(2^d).
   Space complexity: O(d).
*)
program cfree2 (input, output);
type NodePtr = ^Node;
     Node    = record
        info : char;
        left : NodePtr;
        right: NodePtr;
    end;

var d : integer;
    t : NodePtr;

function construct(d : integer) : NodePtr;
var n : NodePtr;
begin
    if d <= 0 then
        n := nil
    else begin
        new(n);
        n^.info := chr(ord('a') + d - 1);
        n^.left := construct(d - 1);
        (* Right branch is idenctical to left; avoid constructing it anew. *)
        n^.right := n^.left
    end;
    construct := n
end;

procedure printBT(t : NodePtr);
begin
    if t <> nil then begin
        (* This is in-order traversal.
           Pre-order or post-order would also be fine here. *)
        printBT(t^.left);
        write(t^.info);
        printBT(t^.right)
        (* Since t^.left = t^.right, printBT(t^.right) should print
           the same characters as printBT(t^.left). But this is
           exactly the correct answer! *)
    end
end;

procedure freeBT(t : NodePtr);
begin
    if t <> nil then begin
        (* We only need to free the memory allocated by the left child! *)
        printBT(t^.left);
        dispose(t);
    end
end;
begin
    readln(d);
    
    (* Create a binary tree that represents the conflict-free string. *) 
    t := construct(d);

    (* Traverse the tree and print the string. *)
    printBT(t);
    writeln;

    (* Clean-up: Destroy the tree and free the allocated memory. *)
    freeBT(t);
end.
