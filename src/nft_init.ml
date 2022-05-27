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

let mint_param = Mint "mint"

let transfer_param = Transfer ("transfer", Nat 1, Address "tz1dBc59R55bQrfJ7rhnELFn5K5JFUQvsVSj")




 (* 

init: Pair (Pair (Pair "tezos-scaml-nft" "https://tezos.com") 0) (Pair { } { })
mint_param: Left "mint"
transfer_param: Right (Pair "transfer" (Pair 1 "tz1dBc59R55bQrfJ7rhnELFn5K5JFUQvsVSj"))


 *)
