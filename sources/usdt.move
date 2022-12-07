// Copyright (c) Libor DAO.
// SPDX-License-Identifier: MIT

/// Coin<USDT> is the mock token used to test in LiborDAO.
/// It has 9 decimals
module sui_ft_token::usdt {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct USDT has drop {}

    fun init(witness: USDT, ctx: &mut TxContext) {
        // Get a treasury cap for the coin and give it to the transaction sender
        let (treasury, metadata) = coin::create_currency(witness, 9, b"LiborTestUSDT", b"USDT", b"", option::none(), ctx);
        transfer::freeze_object(metadata);
        transfer::transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<USDT>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<USDT>, coin: Coin<USDT>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(USDT{}, ctx);
    }
}
