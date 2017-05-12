## NOTE: Because Google has deprecated it's getCurrentLocation API(), this does not work on Chrome and the geolocation will default to Brandeis. To test Geolocation, please visit on a different browser!
## NOTE2: To view the heat-zone feature, it is advised to set radius to 6 because the distance from Brandeis to BU is between 6-8 miles away! Of course, if you are in a different location, then you will have to add Parties at various locations and experiment with that.
## NOTE3: To test Stripe, the account created must have a routing/account info! It will not work if the host does not supply it, because where would the transfered money go, right? The currently generated events do not have the info, and it is not advised to RSVP to them. However, you can check the Stripe fake account/credit cards and use them to test!
## NOTE4: To test identity validation and sexual offender check, we provide you with a few sexual offenders from Family Watchdog DB. Their names and date of birth is crucial when you click 'Verify Identity' in the Account tab. Once you submit the SSN and address, please return to the user profile. On the page, you will see "enter verify check". Refresh the page and an offender icon will appear on the profile.
## Paul Decker, 02/22/1967, 2200 Block St., Fort Smith, AR 72923
## Michael Brown, 01/30/1985, 1912 Mechanicsville Rd., Florence, SC 29501
## NOTE5: We noticed an unusual bug in our chat after deployment to Heroku. The susequest users in the channels keep typing blank messages. This error is not on localhost :|

##### Team name:​ Fiesto

Meeting times:​ Sunday from 9-11pm

Purpose:​ To create a web-based application that allows users to find house
parties within a certain radius and connect with the host of the party. The application will also
support a social media component such as chat rooms, profiles, and party documentation.

Features:

● This application has a log-in/register screen and
database to store the information for each user. Users will make profiles and adjust their
party search radius there.

● In addition to the profiles, the application will incorporate a security feature where new
profiles will be checked to verify their identity. The security check will require users to
verify using their credit cards.

● Another security check follows to make sure that person is not affiliated with any
criminal activity.

● Transactions will be made through the credit card they registered with. The guests could
be charged a fee in order to help pay for party costs but such charges will not be applied
unless they actually attend the party. (even if they RSVP)

● This attendance verification can be done via the Geocoding Gem on the individual's
phone or via check-ins with the host.

● After the party, there is an after party social media platform for the users to post about the
event, share photos/videos, and connect with people met at the party.
