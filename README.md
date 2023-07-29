# Loyalty Program

## Install

### Clone the repository

```shell
git clone git@github.com:chandra-phang/loyalty-program.git
cd loyalty-program
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.1.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv):

```shell
rbenv install 3.1.2
```

### Install PostgreSQL

```shell
brew install postgresql
```

## Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle
```

### Initialize the Database

```shell
rails db:create db:migrate db:seed
```

## Running the Application
Start postgresql first
```shell
pg_ctl -D /usr/local/var/postgres start
```

Run the server, accessible through http://localhost:3000/
```shell
rails s
```

### Curl to Report Completed Order
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

## Running Tests

```shell
rspec
```

## Run Tier Calibration Task after new year started

```shell
rake customers:calibrate_tier
```

## Run Customer Tier Archieve after new year started

```shell
rake 'customers:archieve_tier[:year]'
```
