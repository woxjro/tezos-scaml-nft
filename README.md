# tezos-scaml-nft
A NFT application written in SCaml on the Tezos chain.


# deploy
`./tezos-client originate contract nft transferring 0 from myself running ./src/nft.tz --burn-cap 100 --init 'Pair (Pair (Pair "tezos-scaml-nft" "<host>") 0) (Pair { } { })' --force`



# mint
`./tezos-client transfer 0 from myself to nft --arg 'Left "mint"' --burn-cap 100`


# transfer
`./tezos-client transfer 0 from myself to nft --arg 'Right (Pair "transfer" (Pair 1 "<to_address>"))' --burn-cap 100`

![Screenshot from 2022-05-25 21-15-03](https://user-images.githubusercontent.com/63214188/170263747-bcd123fd-1bd0-43e9-aec7-e0096f2925fd.png)
