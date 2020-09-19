# Bank Tech Test
```
 /$$$$$$$$ /$$                       /$$$$$$$                      /$$      
|__  $$__/| $$                      | $$__  $$                    | $$      
   | $$   | $$$$$$$   /$$$$$$       | $$  \ $$  /$$$$$$  /$$$$$$$ | $$   /$$
   | $$   | $$__  $$ /$$__  $$      | $$$$$$$  |____  $$| $$__  $$| $$  /$$/
   | $$   | $$  \ $$| $$$$$$$$      | $$__  $$  /$$$$$$$| $$  \ $$| $$$$$$/ 
   | $$   | $$  | $$| $$_____/      | $$  \ $$ /$$__  $$| $$  | $$| $$_  $$ 
   | $$   | $$  | $$|  $$$$$$$      | $$$$$$$/|  $$$$$$$| $$  | $$| $$ \  $$
   |__/   |__/  |__/ \_______/      |_______/  \_______/|__/  |__/|__/  \__/
                                                                            
                                                                            
                                                                            
            /$$$$$$        /$$$$$$$            /$$           /$$            
           /$$__  $$      | $$__  $$          | $$          | $$            
  /$$$$$$ | $$  \__/      | $$  \ $$  /$$$$$$ | $$  /$$$$$$ | $$$$$$$       
 /$$__  $$| $$$$          | $$$$$$$/ |____  $$| $$ /$$__  $$| $$__  $$      
| $$  \ $$| $$_/          | $$__  $$  /$$$$$$$| $$| $$  \ $$| $$  \ $$      
| $$  | $$| $$            | $$  \ $$ /$$__  $$| $$| $$  | $$| $$  | $$      
|  $$$$$$/| $$            | $$  | $$|  $$$$$$$| $$| $$$$$$$/| $$  | $$      
 \______/ |__/            |__/  |__/ \_______/|__/| $$____/ |__/  |__/      
                                                  | $$                                                                                                     
```
[![Build Status](https://travis-ci.com/ralphm10/bank_tech_test.svg?branch=master)](https://travis-ci.com/ralphm10/bank_tech_test)
## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### To run tests and view coverage

* Clone this respository then:
```
> bundle install
> rspec
```

### Approach to the problem

First I sketched out a class diagram which defined the classes and their methods. I felt that the 'core' methods of a bank account (withdraw and deposit) should live on a separate class, and anything to do with statements should be in another. I originally recorded transactions on the account class but then moved this onto the statement class, which I believe helps adhere to the single responsibility process.

The code does defend against minor edge cases such as handling a negative withdrawal or deposit, however other edge cases (such as how to deal with going overdrawn) have not been addresses as they were not part of the requirements. As well as using the Rspec library, the code has been thoroughly feature tested in a IRB/Pry throughout.  

### Progress

* The test coverage is 100%
* Code has been analysed with rubocop to adhere to ruby style guidelines and coverage calculated with SimpleCov
* This project meets the acceptance criteria above, see below example interaction
* The ruby time class has been utilised to store today's date on a transaction, however other dates have been used as mocks in the tests
* I have also passed in decimal numbers in the deposit and withdrawal amounts to demonstrate that the program can handle these effectively

```
2.7.1 :001 > require './lib/account.rb'
 => true
2.7.1 :002 > account = Account.new
2.7.1 :003 > account.deposit(1000.10)
 => ["10/09/2020 || 1000.10 || || 1000.10"]
2.7.1 :004 > account.deposit(2000.20)
 => ["10/09/2020 || 1000.10 || || 1000.10", "10/09/2020 || 2000.20 || || 3000.30"]
2.7.1 :005 > account.withdraw(500.15)
 => ["10/09/2020 || 1000.10 || || 1000.10", "10/09/2020 || 2000.20 || || 3000.30", "10/09/2020 || || 500.15 || 2500.15"]
2.7.1 :006 > account.statement.print_statement
date || credit || debit || balance
10/09/2020 || || 500.15 || 2500.15
10/09/2020 || 2000.20 || || 3000.30
10/09/2020 || 1000.10 || || 1000.10
```
