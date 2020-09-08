# Bank Tech Test

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
bundle install
rspec
```

### Approach to the problem

First I sketched out a class diagram which defined the classes and their methods. I felt that the 'core' methods of a bank account (withdraw, deposit and showing a balance) should live on a separate class, and anything to do with printing statements should be in another. I originally recorded transactions on the account class but it later became clear that this too should be a class of its own, which I believe helps adhere to the single responsibility process.

The code does defend against minor edge cases such as handling a negative withdrawal or deposit, however other edge cases (such as how to deal with going overdrawn) have not been addresses as they were not part of the requirements. As well as using the Rspec library, the code has been thoroughly feature tested in a IRB/Pry throughout.  

### Progress

* The test coverage is 100%
* Code has been analysed with rubocop to adhere to ruby style guidelines and coverage calculated with SimpleCov
* This project meets the acceptance criteria above, see below example interaction

```
[3] pry(main)> test = Account.new
=> #<Account:0x00007fd2691e1d40 @balance=0, @transaction_log=#<TransactionLog:0x00007fd2691e1cf0 @transactions=[]>>
[4] pry(main)> statement = Statement.new
=> #<Statement:0x00007fd2651952a0>
[5] pry(main)> test.deposit(1000, '10/01/2012')
=> ["10/01/2012 || 1000.00 || || 1000"]
[6] pry(main)> test.deposit(2000, '13/01/2012')
=> ["10/01/2012 || 1000.00 || || 1000", "13/01/2012 || 2000.00 || || 3000"]
[7] pry(main)> test.withdraw(500, '14/01/2012')
=> ["10/01/2012 || 1000.00 || || 1000", "13/01/2012 || 2000.00 || || 3000", "14/01/2012 || || 500.00 || 2500"]
[8] pry(main)> statement.print_statement(test.transaction_log)
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500
13/01/2012 || 2000.00 || || 3000
10/01/2012 || 1000.00 || || 1000
=> ["14/01/2012 || || 500.00 || 2500", "13/01/2012 || 2000.00 || || 3000", "10/01/2012 || 1000.00 || || 1000"]
```
