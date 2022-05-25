
# deploy
./tezos-client originate contract nft transferring 0 from myself running ./src/nft.tz --burn-cap 100 --init 'Pair (Pair (Pair "tezos-scaml-nft" "https://tezos.com") 0) (Pair { } { })' --force


#mint
./tezos-client transfer 0 from myself to nft --arg 'Left "mint"' --burn-cap 100


#transfer
./tezos-client transfer 0 from myself to nft --arg 'Right (Pair "transfer" (Pair 1 "tz1dBc59R55bQrfJ7rhnELFn5K5JFUQvsVSj"))' --burn-cap 100
