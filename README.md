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
If you buy 2 or more lavender hearts then the price drops by 75p.

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
#Custom promotion
ten_off = PercentageDiscount.new(60,10)
#Promotion being called
ten_off.calculate_discount(@basket)
```

## Scanning items

```
co.scan(item)
```

You can scan the item by adding the product code to the scan method. Here's the list of product codes:
```
Product code  | Name                   | Price
----------------------------------------------------------
001           | Lavender heart         | £9.25
002           | Personalised cufflinks | £45.00
003           | Kids T-shirt           | £19.95
```

To add a Lavender heart you have to do the following:

```
co.scan('001')
```

## Total Amount

To get the total amount of your basket after discounts

```
price = co.total
```

## Example

Here is how you run the checkout in IRB

```
2.3.0 :001 > load 'lib/percentage_discount.rb'
 => true
2.3.0 :002 > load 'lib/multi_discount.rb'
 => true
2.3.0 :003 > percentage = PercentageDiscount.new(60,10)
 => #<PercentageDiscount:0x007ffd92958ca0 @limit=60, @percentage=10>
2.3.0 :004 > multi = MultiDiscount.new('001',2,0.75)
 => #<MultiDiscount:0x007ffd92948800 @product_code="001", @quantity=2, @discount=0.75>
2.3.0 :005 > discount = [multi,percentage]
 => [#<MultiDiscount:0x007ffd92948800 @product_code="001", @quantity=2, @discount=0.75>, #<PercentageDiscount:0x007ffd92958ca0 @limit=60, @percentage=10>]
2.3.0 :006 > load 'lib/checkout.rb'
 => true
2.3.0 :007 > co= Checkout.new
 => #<Checkout:0x007ffd930558c8 @product_list=#<ProductList:0x007ffd93055878>, @basket=#<Basket:0x007ffd93055850 @items=[], @subtotal=0>, @promotional_rules=[]>
2.3.0 :008 > co.scan('001')
 => 9.25
2.3.0 :009 > co.scan('002')
 => 54.25
2.3.0 :010 > co.scan('001')
 => 63.5
2.3.0 :011 > co.scan('003')
 => 83.45
2.3.0 :012 > co.total
 => "£83.45"
```

## Technologies used

I used ruby with Rspec for testing.

## Features

The checkout system is able take custom promotions as well as having new promotions added easily. Features can easily be added and removed as each action has its own class.

## Design approach and Challenges

My design aim was to keep each feature seperate without creating too many classes. The main challenge was applying the discounts. At first I had the discounted being called and applied from the basket. This meant the basket class was calculating discounts, when this was really the job of the checkout system.

Once the discounts were moved to there own classes, I injected the basket from the checkout to calculate discounts. This also meant that when new custom promotions are created they will have access to all the basket information without having to create a new method in the checkout class.

## Future developments and improvement

I feel that I have not tested all the egde cases in detail, although I feel I've covered most in the application. Better refactoring of the method apply_discount found in the checkout class, as this seems to be a large private class.

Once the egde cases test are complete I would like to add a front end system to this, with javacript and html.


