module Data.AddressBook where

import Prelude
import Control.Plus (empty)
import Data.List (List(..), filter, head, null, nubBy)
import Data.Maybe (Maybe)

-- type alias for Entry record
type Entry =
  { firstName :: String
  , lastName  :: String
  , address   :: Address
  }

-- type alias for Address record
type Address =
  { street  :: String
  , city    :: String
  , state   :: String
  }

-- type alias for AddressBook
type AddressBook = List Entry

-- | function from Entry to String
showEntry :: Entry -> String
showEntry entry = entry.lastName <> ", " <>
                  entry.firstName <> ": " <>
                  showAddress entry.address

-- | function from Address to String
showAddress :: Address -> String
showAddress addr =  addr.street <> ", " <>
                    addr.city <> ", " <>
                    addr.state

-- | empty AddressBook
emptyBook :: AddressBook
emptyBook = empty


-- | function to insert an Entry into an address book
insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry entry book = Cons entry book


-- The following type declaration for findEntry was created by me.
-- Verified it is correct compared to the book source repo.
-- | find an entry within an AddressBook by firstName and lastName
findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName book = head $ filter filterEntry book
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.firstName == firstName && entry.lastName == lastName

-- | Exercise 1. (Easy) Test your understanding of the findEntry function by writing down the types of each of its major subexpressions. For example, the type of the head function as used is specialized to AddressBook -> Maybe Entry.
-- | answer: type declaration of the subexpressions
-- | head :: AddressBook -> Maybe Entry
-- | filter :: (Entry -> Boolean) -> AddressBook -> AddressBook
-- |
-- |

-- | Exercise 2. (Medium) Write a function which looks up an Entry given a street address, by reusing the existing code in findEntry. Test your function in PSCi.
findEntryByAddress :: String -> AddressBook -> Maybe Entry
findEntryByAddress street book = head $ filter byAddress book
  where
    byAddress :: Entry -> Boolean
    byAddress entry = entry.address.street == street

-- | Exercise 3. (Medium) Write a function which tests whether a name appears in a AddressBook, returning a Boolean value. Hint: Use PSCi to find the type of the Data.List.null function, which test whether a list is empty or not.
hasName :: String -> String -> AddressBook -> Boolean
hasName first last book = not null $ filter filterEntry book
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.firstName == first && entry.lastName == last

-- | Exercise 4. (Difficult) Write a function removeDuplicates which removes duplicate address book entries with the same first and last names. Hint: Use PSCi to find the type of the Data.List.nubBy function, which removes duplicate elements from a list based on an equality predicate.
removeDuplicates :: AddressBook -> AddressBook
removeDuplicates book = nubBy byFirstAndLast book
  where
    byFirstAndLast :: Entry -> Entry -> Boolean
    byFirstAndLast e1 e2 = e1.firstName == e2.firstName && e1.lastName == e2.lastName

-- Test data below used in PSCi (i.e. pulp repl) to verify functions work
-- printEntry f l b = map showEntry $ findEntry f l b
-- address = {street: "123 N Left Rd.", city: "denver", state: "co"}
-- entry = {firstName: "john", lastName: "smith", address: address}
-- book1 = insertEntry entry emptyBook
-- entry2 = {firstName: "sally", lastName: "farts", address: address}
-- book2 = insertEntry entry2 book1
-- book3 = insertEntry entry book2
-- book4 = insertEntry entry book3
-- book5 = insertEntry entry book4
