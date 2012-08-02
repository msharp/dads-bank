# Dad's Bank

Help teach your kids about saving and the miracle of compound interest.

This is based on an idea in David Owen's book [http://www.amazon.com/First-National-Bank-Dad-Foolproof/dp/1416534253/](The First National Bank of Dad)

I heard it explained in an [http://www.econtalk.org/archives/2012/05/owen_on_parenti.html](EconTalk podcast).

## How it works

There are Banks (dads), which have accounts (kids).

The accounts each have a weekly allowance. The bank has and interest rate and an interest rate period (weekly, monthly, annually).

There are rake tasks to apply the allowance and the interest. 
The allowance should be applied once per week. The interest is calculated and applied pro-rata in a daily rake task.

Account holders can log in and view their account.

## Administration

A Bank can administer accounts (create, update).

To create a new bank, or update the bank details, there are rake tasks available.

## Example

Here is an example deployment on Heroku.

## Todo

Add functionality for ad-hoc credits and withdrawals (currently must me done in console).


