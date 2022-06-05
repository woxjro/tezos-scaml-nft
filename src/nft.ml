open SCaml

(*
        https://better-call.dev/ithacanet/KT1B9uYxtru3oeVBJ9MSaqwjrVgrDuBQEfu4/operations
        mint_count: mint数を数える. NFT毎に与えられるuniqueなID
*)

type config = { title : string; host : string }

type storage = {
  config : config;
  mint_count : nat;
  mint_id_to_owner : (nat, address) map;
  mint_id_to_nft_path : (nat, string) map; (* 本当ならURLではなくHash値 *)
}

let[@entry] mint ( (* param *) ) storage =
  (* {{{ *)
  let max_mint = Nat 100 in
  let mint_count = storage.mint_count in

  (* mint上限 *)
  assert (mint_count <= max_mint);

  let owner_addr = Global.get_source () in
  (* mint_countにowner_addrを追加 *)
  let mint_id_to_owner' =
    Map.add mint_count owner_addr storage.mint_id_to_owner
  in

  (* mintする. (今回はURLを生成する) *)
  let mint_id_to_nft_path' =
    Map.add mint_count
      (storage.config.host ^ "/random_hash_string")
      (* string_of_nat mint_count) *)
      storage.mint_id_to_nft_path
  in

  (* mint_countを更新する *)
  let mint_count' = mint_count +^ Nat 1 in
  let storage' =
    {
      config = storage.config;
      mint_count = mint_count';
      mint_id_to_owner = mint_id_to_owner';
      mint_id_to_nft_path = mint_id_to_nft_path';
    }
  in

  ([ (* operations *) ], storage')
(* }}} *)

(* mint_idが<mint_id>のNFT の所有者を<from_addr>から<to_addr>へと変更する. *)
let[@entry] transfer ((mint_id, to_addr) : nat * address) (storage : storage) =
  (* {{{ *)
  let from_addr = Global.get_source () in

  (* mint_idが<mint_id>となるNFTが存在していてほしい. *)
  assert (Map.mem mint_id storage.mint_id_to_owner);

  (* その持ち主がfrom_addrと一致していてほしい *)
  assert (Map.find mint_id storage.mint_id_to_owner = Some from_addr);

  let mint_id_to_owner' =
    Map.update mint_id (Some to_addr) storage.mint_id_to_owner
  in
  let storage' =
    {
      config = storage.config;
      mint_count = storage.mint_count;
      mint_id_to_owner = mint_id_to_owner';
      mint_id_to_nft_path = storage.mint_id_to_nft_path;
    }
  in

  ([ (* operations *) ], storage')
(* }}} *)
