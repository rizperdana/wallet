# Internal Wallet System

## Requirements
* Based on relationships every entity e.g. User, Team, Stock or any other should have their own defined "wallet" to which we could transfer money or withdraw
* Every request for credit/debit (deposit or withdraw) should be based on records in database for given model
* Every instance of a single transaction should have proper validations against required fields and their source and targetwallet, e.g. from who we are taking money and transferring to whom? (Credits == source wallet == nil, Debits == targetwallet == nil)
* Each record should be created in database transactions to comply with ACID standards
* Balance for given entity (User, Team, Stock) should be calculated by summing records

## To Do:
- [x] Initialize the Rails application.
- [x] Initialize the testing environment with RSpec and Guard.
- [x] Create the following models with the specified attributes and associations:
  * Users, Stocks, and Teams:
    - Name (required)
    - One wallet (through a polymorphic association using the STI pattern)
  * Wallet:
    - Belongs to a walletable (polymorphic)
    - Has many transactions
  * Transactions:
    - Source wallet (belongs to a wallet)
    - Target wallet (belongs to a wallet)
    - Amount (required)
- [x] Implement proper calculations for transaction kinds and wallet actions:
  * Deposit:
    - Amount without source wallet
  * Withdraw:
    - Amount without target wallet
  * Transfer:
    - Amount with source/target wallet
  * Wallet balance:
    - Target transactions minus source transactions
    - Zero if there are no transactions
  * Transaction validations:
    - Amount should be greater than 0
    - Before creating a transaction, amount should be less than or equal to the source wallet's actual balance
- [x] On Users/Stocks/Teams creation, create a wallet for each.
- [x] Initialize the frontend with StimulusJS, Bootstrap, and FontAwesome.
- [x] Implement the following frontend views and actions:
  * Wallet:
    - List owners
    - Create owner: creates Users/Stocks/Teams with a name
    - Show: displays balance and transactions
  * Transactions:
    - Deposit/Withdraw/Transfer.

Run this example:
```bash
git clone git@github.com:rizperdana/wallet.git
cd wallet/
bundle
yarn install --check-files
rails db:migrate RAILS_ENV=development
rails s
```
