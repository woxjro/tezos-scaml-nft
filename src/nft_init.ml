open SCaml
open Nft

let init =
  {
    config = {
            title = "tezos-scaml-nft";
            host = "https://tezos.com";
          };
    mint_count = Nat 0;
    mint_id_to_owner = Map [];
    mint_id_to_nft_path = Map [];
  }

let mint_param = ()

let transfer_param = (Nat 1, Address "tz1dBc59R55bQrfJ7rhnELFn5K5JFUQvsVSj")




 (* 
コントラクトが
(unit %mint) (pair %transfer nat address)
このような↑の感じになっているが, しっかりと構造・文法を理解していない.
とりあえず--scaml-convertして出てきたものにLeft, Rightを付けた.

init: Pair (Pair (Pair "tezos-scaml-nft" "https://tezos.com") 0) (Pair { } { })
mint_param: Left Unit
transfer_param: Right (Pair 1 "tz1dBc59R55bQrfJ7rhnELFn5K5JFUQvsVSj")


 *)
