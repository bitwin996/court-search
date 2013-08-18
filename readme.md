Basketball court search
=======================
1. When user plays basketball somewhere, post the place and its contact.
2. Search places and contact the place from list.
3. If the user can make a reservation, the place get a reservation point.
4. After the user finishes playing, the place get a playing point.


TODO
----
* return JSON data
* integrate design (Twittre Bootstrap)
* save Place
* save PlaceImage
* use Cloud EndPoints

Model
-----
Place
* name
* latitude
* longitude
* fee per an hour
* phone
* address
* open time
* close time
* description
* reservation point
* playing point

PlaceImage
* Place
* url


Functions
---------
* add Place
* search Places
* add reservation and playing point to Place
