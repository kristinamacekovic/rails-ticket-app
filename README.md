# README

## The DBMS
The DMBS used is PostgreSQL, both in development and production. The use on development was mostly decide to ease the headache of deploying to Heroku, which uses only PostgreSQL. The tables present in the DBMS (the models) and their associations are:

- Ticket(s)
  - has many users through bookings
  - has many bookings
- Booking(s)
  - belongs to user
  - belongs to ticket
- User(s)
  - has many bookings
  - has many tickets through bookings
  
  
### Seeding the database
The DB is seeded with fake data using the Faker gem (details in `seeds.rb`)
- 22 tickets
  - 20 that have departure date within 60 days from now (from the day of writing, 2020-06-02)
  - 1 whose departure is 2 minutes from now
  - 1 whose departure is up to an hour from now
- 0 bookings
- 1 user
  - email: **test@test.com**
  - password: **password**
The last 2 tickets are designed for testing a feature that:
- you can buy a ticket whose departure is under 1 hour from now, but you can't cancel it
- tickets whose departure time has passed are removed from the list, both for all tickets and the users bought tickets

To get the most recent tickets with these test cases, I suggest to run `rake db:seed` before running `rails s`

## Authentication and app usage

Done using the devise gem. You can browse the tickets without logging in/registering, but in order to buuy a ticket, you need to register/log in. As described above, there is 1 test user seeded into the DB, but you can also register a new user. When logged in, you can see your username displayed in the top right corner on the home page (and in the heading of your list of bookings).

After you log in, you can see a list of your bookings by clicking "My Tickets" on the home page. You can always return to the home page by pressing the "Back to Tickets" button. All tickets and bookings are displayed in ascending order of departure. You can log out by pressing "Log out" on the home page.

## Buying a ticket
To buy a ticket, you will need to input a card number. To make it as simple as possible, we assume a card number is any number of length 16 (!), only numbers, no dashes(-) or [a-zA-Z] characters. After you buy a tickets (successfully) you will get a confirmation and be shown the details of you purchase. Click "Back to Tickets" to return to the home page. If there are no more available tickets for a ride, next to that ticket on the home page you will se "No more available tickets" where the BUY button would usually be, i.e. you can't buy a ticket that has 0 tickets available.

## Cancelling
To cancel a bought ticket, click "My Tickets" on the home page and click "Cancel" next to the ticket you want to cancel. You can only do this up to an hour before the departure. After you cancel, the ticket disappears from your list of bookings and the counter next to that ticket on the home page is increased by 1.


