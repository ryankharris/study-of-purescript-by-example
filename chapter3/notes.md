# Notes for Chapter 3

In the following initial code:

    module Data.AddressBook where

    import Prelude

    import Control.Plus (empty)
    import Data.List (List(..), filter, head)
    import Data.Maybe (Maybe)

You have to install the following packages via Bower:
- purescript-control for Control.Plus
- purescript-lists for Data.List
- purescript-maybe for Data.Maybe

I made use of Pursuit's search feature to find those. It was simple, packages
were the first things listed in the search results.

## REPL example data, for quick recreation

> printEntry f l b = map showEntry $ findEntry f l b
> address = {street: "123 N Left Rd.", city: "denver", state: "co"}
> entry = {firstName: "john", lastName: "smith", address: address}
> book1 = insertEntry entry emptyBook
> entry2 = {firstName: "sally", lastName: "farts", address: address}
> book2 = insertEntry entry2 book1
> printEntry "ryan" "harris" book2
Nothing
> printEntry "john" "smith" book2
(Just "smith, john: 123 N Left Rd., denver, co")
