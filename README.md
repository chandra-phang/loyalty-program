# Loyalty Program

## Install

### Clone the repository

```shell
git clone git@https://github.com/chandra-phang/loyalty-program.git
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

### Install Postgres

```shell
brew install postgresql
```

## Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Running the Application

```shell
rails s
```

## Running Tests

```shell
rspec
```

## Run Tier Calibration Task After Ney Year Started

```shell
rake customers:calibrate_tier
```

## Run Customer Tier Archieve Task After Ney Year Started

```shell
rake 'customers:archieve_tier[:year]'
```

