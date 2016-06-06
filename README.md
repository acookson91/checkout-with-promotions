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

```
promotions = [ten_off,two_lavender_hearts]
co = Checkout.new(promotions)

```

## Creating a custom promotions

Custom promotions need a calculate_discount method with the basket as an argument. This allows the promotion access to items,subtotal to make calculations. This method should return the discounted amount. Below is an example of how the custom promotions is called from the checkout class.

```
ten_off = PercentageDiscount.new(60,10)
ten_off.calculate_discount(@basket)
```

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

The checkout system is able take custom promotions as well as having new promotions added easily. Features can easily be added and removed as each action has its own class.

## Design approach and Challenges

My design aim was to keep each feature seperate without creating too many classes. The main challenge was applying the discounts. At first I had the discounted being called and applied from the basket. This meant the basket class was calculating discounts, when this was really the job of the checkout system.

Once the discounts were moved to there own classes, I injected the basket from the checkout to calculate discounts. This also meant that when new custom promotions are created they will have access to all the basket information without having to create a new method in the checkout class.

## Future developments and improvement
