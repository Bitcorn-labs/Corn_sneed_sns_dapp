#!/bin/bash

# Source the environment variables from the .env file
if [ -f .env ]; then
  source .env
else
  echo ".env file not found! Please create it with the necessary variables."
  exit 1
fi

echo "attempting to send 3 transactions on each mock ledger..."

dfx canister call mock_old_token_ledger icrc1_transfer '(record {
  to = record { owner = principal "aaaaa-aa" };
  amount = 1_000_000;
  fee = opt 420;
  memo = null;
  from_subaccount = null;
  created_at_time = null;
})'

dfx canister call mock_old_token_ledger icrc1_transfer '(record {
  to = record { owner = principal "aaaaa-aa" };
  amount = 2_000_000;
  fee = opt 420;
  memo = null;
  from_subaccount = null;
  created_at_time = null;
})'

dfx canister call mock_old_token_ledger icrc1_transfer '(record {
  to = record { owner = principal "aaaaa-aa" };
  amount = 3_000_000;
  fee = opt 420;
  memo = null;
  from_subaccount = null;
  created_at_time = null;
})'

dfx canister call mock_new_token_ledger icrc1_transfer '(record {
  to = record { owner = principal "aaaaa-aa" };
  amount = 300_000;
  fee = opt 420;
  memo = null;
  from_subaccount = null;
  created_at_time = null;
})'

dfx canister call mock_new_token_ledger icrc1_transfer '(record {
  to = record { owner = principal "aaaaa-aa" };
  amount = 200_000;
  fee = opt 420;
  memo = null;
  from_subaccount = null;
  created_at_time = null;
})'

dfx canister call mock_new_token_ledger icrc1_transfer '(record {
  to = record { owner = principal "aaaaa-aa" };
  amount = 100_000;
  fee = opt 420;
  memo = null;
  from_subaccount = null;
  created_at_time = null;
})'