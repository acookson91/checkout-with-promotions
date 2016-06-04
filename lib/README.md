# Checkout System

**Task to build a checkout system that can accept custom promotions.**

## Installation Instructions

```
$ git clone https://github.com/acookson91/checkout-with-promotions.git
$ cd checkout-with-promotions
$ bundle install
```

## Setting up promotions/checkout

First you must initialize the checkout with the custom promotions. For this test I've created two promotions classes.

Setting up a percentage promotions

```
PercentageDiscount.new(amount,percentage_off)
```

Example:
If you spend over £60, then you get 10% off of your purchase.

```
ten_off = PercentageDiscount.new(60,10)

```

Setting up a multi buy discount

```
MultiDiscount.new(product_code,quantity,discount)
```

Example:
If you buy 2 or more lavender hearts then the price drops to £8.50.

```
two_lavender_hearts = MultiDiscount.new(001,2,0.75)
```

Adding the promotion to the checkout

``
promotions = [ten_off,two_lavender_hearts]
co = Checkout.new(promotions)

``

## Scanning items

```
co.scan(item)
```

You can scan the item by adding the product to the scan method. Here's the list of product codes:
```
Product code  | Name                   | Price
----------------------------------------------------------
001           | Lavender heart         | £9.25
002           | Personalised cufflinks | £45.00
003           | Kids T-shirt           | £19.95
```

To add a Lavender heart you have to do the following:

```
co.scan(001)
```

## Total Amount

To get the total amount of your basket after discounts

```
price = co.total
```

## Technologies used

I used ruby with Rspec for testing.

## Features


## Design approach and Challenges



## Future developments and improvement
