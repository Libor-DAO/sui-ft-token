# sui-ft-token
Fake FT Token on Sui Devnet for Testing

### Publish package
`sui client publish --gas-budget 10000`

Result:
```
----- Certificate ----
Transaction Hash: pNT4Ix739lxRFIclVGmjQiVqBMGNQdB3H35U6bwHYjI=
Transaction Signature: AA==@tDseXhC3tc5t5jNtLKB2FP/ZjEDpGaV1aRMu4ORtTe4N9zC+ZEysOk/Z2h5LJskm+RR8oy6U/8JEg9ad+cLAAg==@WBoJwkIBNBN0u8lbvDXrE8t7UQqNq/56vcbCUuy49hc=
Signed Authorities Bitmap: RoaringBitmap<[0, 2, 3]>
Transaction Kind : Publish
----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0x11445aefb3bb79adefcb3a6998929a928c545ca1 , Owner: Immutable
  - ID: 0xa87548aed759c30e48d0025e428371f0028772fe , Owner: Account Address ( 0x163c989a48eb685309dcd1d75363aab439c8aeb0 )
  - ID: 0xc55932181441bfde87c8ec68d5ecd46c75a3b2de , Owner: Account Address ( 0x163c989a48eb685309dcd1d75363aab439c8aeb0 )
  - ID: 0xc99a286ab0d12312cbc2ceec6ce5dc196d4721a2 , Owner: Immutable
  - ID: 0xda5ee5cb21dfe0a994cd9c968e5153f64b4e855d , Owner: Immutable
Mutated Objects:
  - ID: 0xdc54d85e3277f5ff62f47dd7fc4c4b763bce2f5b , Owner: Account Address ( 0x163c989a48eb685309dcd1d75363aab439c8aeb0 )
```

* USDT: `0xda5ee5cb21dfe0a994cd9c968e5153f64b4e855d`
* USDC: `0x11445aefb3bb79adefcb3a6998929a928c545ca1`
* USDT treasury: `0xa87548aed759c30e48d0025e428371f0028772fe`
* USDC treasury: `0xc55932181441bfde87c8ec68d5ecd46c75a3b2de`
* Package: `0xc99a286ab0d12312cbc2ceec6ce5dc196d4721a2`


### Mint and transfer USDT
```
export PACKAGE=0xc99a286ab0d12312cbc2ceec6ce5dc196d4721a2
export USDT_TREASURY=0xa87548aed759c30e48d0025e428371f0028772fe
export MY_RECIPIENT=0xd723ee48d6664e1bd6766b3d85280de6121262a5 // your wallet address
sui client call --gas-budget 10000 --package $PACKAGE --module "usdt" --function "mint" --args $USDT_TREASURY 1000000000 $MY_RECIPIENT
```

### Mint and transfer USDC
```
export PACKAGE=0xc99a286ab0d12312cbc2ceec6ce5dc196d4721a2
export USDC_TREASURY=0xc55932181441bfde87c8ec68d5ecd46c75a3b2de
export MY_RECIPIENT=0xd723ee48d6664e1bd6766b3d85280de6121262a5 // your wallet address
sui client call --gas-budget 10000 --package $PACKAGE --module "usdc" --function "mint" --args $USDC_TREASURY 1000000000 $MY_RECIPIENT
```
