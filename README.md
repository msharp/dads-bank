# Dad's Bank

Help teach your kids about saving and the miracle of compound interest.

This is based on an idea in David Owen's book [The First National Bank of Dad](http://www.amazon.com/First-National-Bank-Dad-Foolproof/dp/1416534253/)

I heard it explained in an [EconTalk podcast](http://www.econtalk.org/archives/2012/05/owen_on_parenti.html).

## How it works

There are banks (dads), which have accounts (kids).

The accounts each have a weekly allowance. The bank has an interest rate (default is 5%) and an interest rate period (weekly, monthly, annually).

There are rake tasks to apply the allowance and the interest. 
The allowance should be applied once per week. The interest is calculated and applied *pro-rata* in a daily rake task.

Account holders can log in and view their account.

## Administration

A bank can administer accounts (create, update).

To create a new bank, or update the bank details, there are rake tasks available. Run `rake -T` to see a list.

## Example

Here is an [example deployment on Heroku](http://dads-bank.herokuapp.com/).

There are three accounts with different allowance amounts.

To see an account screen, log in with one of the following username/password combinations:

    Bart/simpson
    Lisa/simpson
    Maggie/simpson

To deploy on Heroku, you need to set up the two scheduled tasks to run once each day.

    rake bank:allowance
    rake bank:interest

Note: the allowance task is restricted to applying the allowance amount only on Sundays.

## Todo

  - Add functionality for *ad hoc* credits and withdrawals (currently must be done with console).
  - Interface for managing bank properties such as interest rate.
  - Better test coverage.

