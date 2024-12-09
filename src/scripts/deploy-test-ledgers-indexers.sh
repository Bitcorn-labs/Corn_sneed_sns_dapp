#!/bin/bash

# Source the environment variables from the .env file
if [ -f .env ]; then
  source .env
else
  echo ".env file not found! Please create it with the necessary variables."
  exit 1
fi

dfx deploy bitcorn_sneed_dapp_backend --specified-id "bkyz2-fmaaa-aaaaa-qaaaq-cai"

dfx deploy bitcorn_sneed_dapp_frontend --specified-id "be2us-64aaa-aaaaa-qaabq-cai"

dfx deploy mock_old_token_ledger --argument "(variant { Init = 
record {
     token_symbol = \"oBITCORN\";
     token_name = \"old BITCORN\";
     minting_account = record { owner = principal \"$MINTER\" };
     transfer_fee = 420;
     metadata = vec {};
     initial_balances = vec { record { record { owner = principal \"$DEFAULT\"; }; 10_000_000_000; }; };
     archive_options = record {
         num_blocks_to_archive = 1000;
         trigger_threshold = 2000;
         controller_id = principal \"$MINTER\";
     };
 }
})" --specified-id "br5f7-7uaaa-aaaaa-qaaca-cai"

dfx deploy mock_new_token_ledger --argument "(variant { Init = 
record { 
     token_symbol = \"nBITCORN\";
     token_name = \"new BITCORN\";
     minting_account = record { owner = principal \"$MINTER\" };
     transfer_fee = 420;
     metadata = vec {};
     initial_balances = vec { record { record { owner = principal \"$DEFAULT\"; }; 10_000_000_000; }; };
     archive_options = record {
         num_blocks_to_archive = 1000;
         trigger_threshold = 2000;
         controller_id = principal \"$MINTER\";
     };
 }
})" --specified-id "by6od-j4aaa-aaaaa-qaadq-cai"

dfx deploy mock_old_token_indexer --argument "(opt variant { Init = 
record {
    ledger_id = principal \"$CANISTER_ID_MOCK_OLD_TOKEN_LEDGER\";
    retrieve_blocks_from_ledger_interval_seconds = opt 10; 
    }
})" --specified-id "b77ix-eeaaa-aaaaa-qaada-cai"

dfx deploy mock_new_token_indexer --argument "(opt variant { Init = 
record {
    ledger_id = principal \"$CANISTER_ID_MOCK_NEW_TOKEN_LEDGER\";
    retrieve_blocks_from_ledger_interval_seconds = opt 10; 
    }
})" --specified-id "bw4dl-smaaa-aaaaa-qaacq-cai"