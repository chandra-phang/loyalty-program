## Backend API

### Order Endpoint

An endpoint to report a completed order, saving it in the database and recalculating the customer's tier.

```json
POST /api/report-order
{
  "customerId": "123",
  "customerName": "Taro Suzuki",
  "orderId": "T123",
  "totalInCents": 3450,
  "date": "2022-03-04T05:29:59.850Z"
}
```

### Customer Information Endpoint

An endpoint returning information about a customer when given their ID.

```json
GET /api/customer-info/:customerId
{
  "currentTier": "Silver",
  "tierStartDate": "2021-01-01",
  "amountSpentSinceStart": "$100.00",
  "amountToReachNextTier": "$400.00",
  "nextYearDowngradeTier": "Bronze",
  "downgradeDate": "2023-01-01",
  "amountToSpendToMaintainTier": "$0.00"
}
```

### Orders List Endpoint

An endpoint listing the customer's orders since the start of last year.

```json
GET /api/customer-orders/:customerId
[
  {"orderId": "T123", "date": "2022-03-04", "total": "$34.50"},
  {"orderId": "T124", "date": "2022-03-05", "total": "$45.20"}
]
```

## Frontend App

### Customer Information Page
A page displaying information from the customer information endpoint.

### Order History Page
A page displaying the customer's order history from the orders list endpoint.

## Loyalty Program

### Install

#### Clone the repository

```shell
git clone git@github.com:chandra-phang/loyalty-program.git
cd loyalty-program
```

#### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.1.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv):

```shell
rbenv install 3.1.2
```

#### Install PostgreSQL

```shell
brew install postgresql
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle
```

#### Initialize the Database

```shell
rails db:create db:migrate db:seed
```

#### Running the Application
Start PostgreSQL first

```shell
pg_ctl -D /usr/local/var/postgres start
```

Run the server, accessible through http://localhost:3000/

```shell
rails s
```

#### Curl to Report Completed Order

```shell
curl --location 'http://localhost:3000/orders/report' \
--header 'Content-Type: application/json' \
--data '{
    "customerId": "123",
    "customerName": "Taro Suzuki",
    "orderId": "T123",
    "totalInCents": 3450,
    "date": "2022-03-04T05:29:59.850Z"
}'
```

### Running Tests

```shell
rspec
```

#### Run Tier Calibration Task after the new year has started

```shell
rake customers:calibrate_tier
```

#### Run Customer Tier Archive after the new year has started

```shell
rake 'customers:archive_tier[:year]'
```
