# README

1. Presentation of the project
The project aims to connect young artists and art enthusiasts. Artists will be able to sell their works (frescoes, sculptures, etc.).

2. User journey
A user can choose by theme or keyword, in order to access a certain number of products, buy them online, and then receive or collect them on site.

3. Concretely and technically
On the user side: the user creates his account, performs a search on the platform, chooses the work that interests him, discusses with the artist, and purchases it if it suits him. The user can delete his order until the artist has confirmed it on his side. the user has a "dynamic" space, that is to say based on his preferences.

Artist side: The artist creates his account by filling in his information (siret number ...). He then completes a descriptive sheet of his activity (Joshua, painter, specialization: contemporary art). He then adds his works which he sells on his professional space with a description of the work. The artist can receive opinions / recommendations from users who have already been clients. he can also create events.

The user and the artist can chat via messaging.

3.1. Database
Here is the non-exhaustive list of minimum tables (we will prioritize):

Table User: for customers, professionals and Administrator

Table Category: which brings together all the categories

Table Product: for artists' works

Table Cart: which allows you to place an order

Table Order: to manage all orders

Table Event: to promote young artists and their work

Message Table: for exchanges between artists and clients

Table Testimonials: for opinions on artists

Of course all these tables will be functional thanks to the joins (intermediate tables) and the relations which are associated with it (1-N / N-N).

3.2. Forehead
We will start at least on HTML / CSS / Vanilla JS, and if the force is with us, a javascript framework.

3.3. backend
* API:

Stripe: payment

Google: Oauth sign-in

Send Grid: emails

4. The minimalist but functional version that must have been delivered the first week
Possibility for a user to make a transaction with an artist. His order will be available in his space with the reference of the artist, the product, the order date etc.

The global search on the site will be functional.

5. The version that we will present to the jury
100% functional platform with: - notice - payment - advanced research - client area - artist area - administrator area - real-time scanning - API to retrieve trends

6. Our mentor
Francois, Corsair session 5.
