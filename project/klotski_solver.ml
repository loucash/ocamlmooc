(* prelude *)
exception NotFound

type 'e rel = 'e -> 'e list
type 'e prop = 'e -> bool

type ('a, 'set) set_operations = {
  empty : 'set;              (* The empty set. *)
  mem : 'a -> 'set -> bool;  (* [mem x s = true] iff [x] is in [s]. *)
  add : 'a -> 'set -> 'set;  (* [add s x] is the set [s] union {x}. *)
}

type ('configuration, 'move) puzzle = {
  move : 'configuration -> 'move -> 'configuration;
  possible_moves : 'configuration -> 'move list;
  final : 'configuration -> bool
}

type piece_kind = S | H | V | C | X
type piece = piece_kind * int
let x = (X, 0) and s = (S, 0) and h = (H, 0)
let (c0, c1, c2, c3) = ((C, 0), (C, 1), (C, 2), (C, 3))
let (v0, v1, v2, v3) = ((V, 0), (V, 1), (V, 2), (V, 3))
let all_pieces : piece list = [ s; h; c0; c1; c2; c3; v0; v1; v2; v3 ]

type board = piece array array
let initial_board =
  [| [| v0 ; s  ; s  ; v1 |];
     [| v0 ; s  ; s  ; v1 |];
     [| v2 ; h  ; h  ; v3 |];
     [| v2 ; c0 ; c1 ; v3 |];
     [| c2 ; x  ; x  ; c3 |] |]

let initial_board_simpler =
  [| [| c2 ; s  ; s  ; c1 |] ;
     [| c0 ; s  ; s  ; c3 |] ;
     [| v1 ; v2 ; v3 ; v0 |] ;
     [| v1 ; v2 ; v3 ; v0 |] ;
     [| x  ; x  ; x  ; x  |] |]

let initial_board_trivial =
  [| [| x  ; s  ; s  ; x  |] ;
     [| x  ; s  ; s  ; x  |] ;
     [| x  ; x  ; x  ; x  |] ;
     [| x  ; x  ; x  ; x  |] ;
     [| x  ; x  ; x  ; x  |] |]

type direction = { dcol : int; drow : int; }
type move = Move of piece * direction * board
let move _ (Move (_, _, b)) = b

(* exercise *)
(* grade_only [ 1 ] ;; *)
let rec loop p f x = if p x then x else loop p f (f x);;

let rec exists p l =
  match l with
  | [] -> false
  | h::rs -> if p h then true else exists p rs;;

let rec find p l =
  match l with
  | [] -> raise NotFound
  | h :: rs -> if p h then h else find p rs;;

(* --- Part A: A Generic Problem Solver --- *)

let near x =
  let upper = x + 2 in 
  let rec aux accu i =
    if i > upper then
      accu
    else
      aux (accu @ [i]) (i + 1)
  in
  aux [] (x - 2);;

let rec flat_map r = function
  |[] -> []
  |x::xs -> List.append (r x) (flat_map r xs);; 

let rec iter_rel rel n =
  "Replace this string with your implementation." ;;


let solve r p x =
  "Replace this string with your implementation." ;;

let solve_path r p x =
  "Replace this string with your implementation." ;;

let archive_map opset r (s, l) =
  "Replace this string with your implementation." ;;

let solve' opset r p x =
  "Replace this string with your implementation." ;;

let solve_path' opset r p x =
  "Replace this string with your implementation." ;;

let solve_puzzle p opset c =
  "Replace this string with your implementation." ;;

(* --- Part B: A Solver for Klotski --- *)

let final board =
  "Replace this string with your implementation." ;;

let move_piece board piece { drow; dcol } =
  "Replace this string with your implementation." ;;

let possible_moves board =
  "Replace this string with your implementation." ;;

module BoardSet = Set.Make (struct
    type t = board
    let compare b1 b2 =
      failwith "Replace this with your implementation." ;;
  end)

let solve_klotski initial_board =
  "Replace this string with your implementation." ;;
