/*
This program implements an airline flight booking system.  

It enables a user to check if it is possible to fly between two cities at a certain interval of time that is 

input by the user.

The Prolog program contains 6 cities, namely Delhi, Chennai, Jaipur, Mumbai, Goa, Bangalore.

The timing system used for the flights is a 24-hour clock system.
*/

/*Features:
  1. The fly(A,B,from,to) query allows the user to check if there is any available flight between cities A and B, between the time interval from-to.
  2. It prints the flight details, as the flight deaprture time and the time at which it will reach its destination, along with the name of thedestination and departure city. 
  3. It checks if the input time is valid or not. In case of invalid time, it reports failure. 
*/ 

/*
Delhi - 5
Chennai - 4
Mumbai - 6
Bangalore - 3
Goa - 2
Jaipur - 1
*/


:- initialization(main).
main :- write('                      *******Airline System*******').


/*Initializing the flight path and timings*/

/*Flights from Jaipur(1)*/
path(1, 5, 03:00, 04:20).
path(1, 5, 12:00, 13:20).
path(1, 2, 14:25, 17:25).
path(1, 6, 22:40, 23:40).
path(1, 3, 17:05, 18:25).
path(1, 4, 10:25, 12:05).

/*Flights from Goa(2)*/
path(2, 3, 17:00, 18:00).
path(2, 6, 20:20, 20:50).
path(2, 1, 18:00, 21:00).
path(2, 4, 01:15, 02:20).
path(2, 5, 06:45, 08:00).

/*Flights from Bangalore(3)*/
path(3, 4, 20:00, 21:00).
path(3, 6, 14:10, 15:40).
path(3, 2, 05:20, 06:20).
path(3, 1, 04:10, 05:30).
path(3, 5, 22:20, 23:50).

/*Flights from Chennai(4)*/
path(4, 5, 14:00, 17:00).
path(4, 6, 01:00, 03:30).
path(4, 3, 02:00, 03:00).
path(4, 3, 14:00, 15:00).
path(4, 3, 17:00, 18:00).

/*Flights from Delhi(5)*/
path(5, 1, 11:10, 12:20).
path(5, 1, 08:40, 09:50).
path(5, 1, 19:20, 20:30).
path(5, 6, 11:00, 13:00).
path(5, 4, 12:00, 15:00).

/*Flights from Mumbai(6)*/
path(6, 5, 04:00, 06:00).
path(6, 4, 03:50, 07:00).
path(6, 1, 17:00, 18:00).
path(6, 3, 09:30, 11:00).
path(6, 2, 10:00, 10:30).
path(6, 2, 20:00, 20:30).
path(6, 2, 19:00, 19:30).

/*Initializing the cities*/
city(jaipur,1).
city(goa,2).
city(bangalore,3).
city(chennai,4).
city(delhi,5).
city(mumbai,6).

/*
checking for validity of time value
*/
validTime(H1:M1):-
nonvar(H1),
nonvar(M1),
number(H1),
number(M1),
print('The input time is valid.').

/* 
Function to check if input time is earlier than a particlar flight time.
*/
isEarlier(H1:M1, H2:M2):-
((H2 == H1 , M1 < M2) ;
(H1 < H2 );  (H2 = H1 , M2 = M1)).
 
/* 
Function to check if input time is later than a particlar flight time. 
*/
isLater(H1:M1, H2:M2):-
((H2 == H1 , M1 > M2) ;
(H1 > H2 ) ; (H2 = H1, M2 = M1)).



/*
Function to print available flights
*/
printDetails(A, B, Start, End):-
   nl,write('Departure city: '),
   nl,write(A),
   nl,write('Arrival city: '),
   nl,write(B),
   nl,write('Departure time: '),
   nl,write(Start),
   nl,write('Arrival time: '),
   nl,write(End).


/*
fly function, which checks if the user can fly between two cities, given a time interval.
start and end time should be given in H1:M1 format.
*/
fly(A, B, Start, End):-
validTime(Start),nl,
validTime(End),nl,
city(A,From),
city(B,To),
checkPath(A,B,From, To, Start, End).

/*
fly function, which checks if the user can fly between two cities, given a time interval.
start and end time should be given in H1:M1 format.
*/
checkPath(A,B,From, To, Start, End):-
nl,write('Checking flight availability......'),
path(From,To,Start_temp,End_temp),
isEarlier(Start,Start_temp),
isLater(End, End_temp),
printDetails(A, B, Start_temp, End_temp).
