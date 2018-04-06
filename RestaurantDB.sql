SET search_path = "RestaurantDB";

CREATE TABLE RATER
(USER_ID CHAR(5) PRIMARY KEY,
EMAIL CHAR(30),
NAME  CHAR(30),
JOINDATE DATE,
TYPE CHAR(15) CHECK ((TYPE = 'Blog') OR (TYPE = 'Online') OR (TYPE = 'Food Critic')),
REPUTATION INT DEFAULT 1,
CHECK ((REPUTATION >= 1) AND (REPUTATION <= 5)));

CREATE TABLE RESTAURANT
(RESTAURANT_ID CHAR(5) PRIMARY KEY,
NAME  CHAR(25),
TYPE CHAR(25),
URL CHAR(50) );

CREATE TABLE RATING
(RATING_ID CHAR(5) PRIMARY KEY,
USER_ID CHAR(5) REFERENCES RATER(USER_ID),
ORDER_DATE TIMESTAMP UNIQUE,
PRICE INT CHECK ((PRICE >= 1) AND (PRICE <= 5)),
FOOD INT CHECK ((FOOD >= 1) AND (FOOD <= 5)),
MOOD INT CHECK ((MOOD >= 1) AND (MOOD <= 5)),
STAFF INT CHECK ((STAFF >= 1) AND (STAFF <= 5)),
COMMENTS CHAR(500),
RESTAURANT_ID CHAR(5) REFERENCES RESTAURANT(RESTAURANT_ID));

CREATE TABLE LOCATION
(LOCATION_ID CHAR(5) PRIMARY KEY,
FIRST_OPEN_DATE DATE,
MANAGER_NAME CHAR(15),
PHONE_NUMBER CHAR(13),
STREET_ADDRESS CHAR(50),
HOUR_OPEN TIME,
HOUR_CLOSE TIME CHECK (HOUR_CLOSE > HOUR_OPEN),
RESTAURANT_ID CHAR(5) REFERENCES RESTAURANT(RESTAURANT_ID) );

CREATE TABLE MENUITEM
(ITEM_ID CHAR(4) PRIMARY KEY,
ITEM_NAME CHAR(50),
ITEM_TYPE CHAR(30),
ITEM_CATEGORY CHAR(30),
ITEM_DESCRIPTION CHAR(350),
PRICE DECIMAL(3,1) CHECK (PRICE > 0),
RESTURANT_ID CHAR(5) REFERENCES RESTAURANT(RESTAURANT_ID) );

CREATE TABLE RATINGITEM
(RATING_ID CHAR(5) REFERENCES RATING(RATING_ID),
USER_ID CHAR(5) REFERENCES RATER(USER_ID),
ORDER_DATE TIMESTAMP REFERENCES RATING(ORDER_DATE),
ITEM_ID CHAR(4) REFERENCES MENUITEM(ITEM_ID),
RATING INT CHECK (RATING >= 1 AND RATING <= 5),
COMMENTS CHAR(200) );

/* 15 raters */

INSERT INTO RATER
VALUES
('00031', 'foodie123@gmail.com', 'foodie123', '2018-04-14', 'Blog', 4);
INSERT INTO RATER
VALUES
('00032', 'pielover42@gmail.com', 'pielover42', '2010-04-13', 'Online', 3);
INSERT INTO RATER
VALUES
('00033', 'theCocoCrisper@gmail.com', 'theCocoCrisper', '2011-05-28', 'Blog', 2);
INSERT INTO RATER
VALUES
('00034', 'WineAndCheese78@hotmail.com', 'WineAndCheese78', '2011-08-12', 'Food Critic', 1);
INSERT INTO RATER
VALUES
('00035', 'MuncherMan89@yahoo.com', 'MuncherMan89', '2011-09-26', 'Blog', 5);
INSERT INTO RATER
VALUES
('00036', 'FoodSnob2005@gmail.com', 'FoodSnob2005', '2013-02-07', 'Online', 1);
INSERT INTO RATER
VALUES
('00037', 'foodcritic01@gmail.com', 'FoodCritic01', '2013-02-28', 'Food Critic', 4);
INSERT INTO RATER
VALUES
('00038', 'BurgerAndFries@gmail.com', 'BurgerAndFries', '2013-07-12', 'Food Critic', 5);
INSERT INTO RATER
VALUES
('00039', 'fakeemail@gmail.com', 'ChefRams', '2013-08-27', 'Online', 4);
INSERT INTO RATER
VALUES
('00040', 'Follow4Follow@gmail.com', 'Follow4Follow', '2014-07-03', 'Blog', 2);
INSERT INTO RATER
VALUES
('00041', 'ASideOfFries@gmail.com', 'ASideOfFries', '2015-01-26', 'Food Critic', 5);
INSERT INTO RATER
VALUES
('00042', 'ASideOfSalt@gmail.com', 'ASideOfSalt', '2015-03-14', 'Blog', 5);
INSERT INTO RATER
VALUES
('00043', 'cappamunch@gmail.com', 'cappamunch', '2016-10-27', 'Blog', 4);
INSERT INTO RATER
VALUES
('00044', 'LesPetitsNoms@gmail.com', 'LesPetitsNoms', '2017-06-13', 'Food Critic', 1);
INSERT INTO RATER
VALUES
('00045', 'FoodiesOttawa@gmail.com', 'FoodiesOttawa', '2018-02-19', 'Online', 3);


/* 12 restaurants */

INSERT INTO RESTAURANT
VALUES ('00001', 'The Works', 'Casual Dining', 'http://www.worksburger.com/');
INSERT INTO RESTAURANT
VALUES ('00002', 'Moose McGuires', 'Pub', 'http://www.moosemcguires.com/');
INSERT INTO RESTAURANT
VALUES ('00003', 'Central Bierhaus', 'Casual Dining, Bar', 'http://centralbierhaus.ca/');
INSERT INTO RESTAURANT
VALUES ('00004', 'Saigon Boy Noodle House', 'Casual Dining', 'http://www.saigonboynoodlehouse.ca/');
INSERT INTO RESTAURANT
VALUES ('00005', 'The Soca Kitchen', 'Casual Dining', 'https://www.thesocakitchen.com/');
INSERT INTO RESTAURANT
VALUES ('00006', 'MHK Sushi', 'Casual Dining', 'http://www.mhkrestaurant.com/');
INSERT INTO RESTAURANT
VALUES ('00007', 'Bread & Sons Bakery', 'Cafe, Bakery', 'http://breadandsons.com/');
INSERT INTO RESTAURANT
VALUES ('00008', 'The Red Dot', 'Casual Dining', 'http://www.reddotcafe.com/');
INSERT INTO RESTAURANT
VALUES ('00009', 'Five Guys', 'Quick Bites', 'http://www.fiveguys.ca/');
INSERT INTO RESTAURANT
VALUES ('00010', 'SuzyQ', 'Dessert Parlor', 'https://suzyq.ca/');
INSERT INTO RESTAURANT
VALUES ('00011', 'Kallisto', 'Casual Dining', 'https://www.kallisto.ca');
INSERT INTO RESTAURANT
VALUES ('00012', 'Milestones', 'Casual Dining, Bar', 'http://www.milestonesrestaurants.com/');


INSERT INTO LOCATION
VALUES ('00001', '2004-01-11', 'Geoff', '(613)580-4523', '580 Bank Street, Ottawa, ON K1S 3T3', '08:30:00', '22:30:00', '00001');
INSERT INTO LOCATION
VALUES ('00002', '2005-02-02', 'James', '(613)673-3320', '3320 McCarthy Road, Unit 2, Ottawa, ON K1V 9X5', '09:30:00', '23:00:00', '00002');
INSERT INTO LOCATION
VALUES ('00003', '2006-03-23', 'Michael', '(613)650-1049', '650 Kanata Avenue, Ottawa, ON K2T 1H6', '10:00:00', '22:30:00', '00003');
INSERT INTO LOCATION
VALUES ('00004', '2007-04-14', 'Richard', '(613)648-2642', '648 Somerset Street West, Ottawa, ON K1R 5K1', '11:00:00', '21:00:00', '00004');
INSERT INTO LOCATION
VALUES ('00005', '2008-05-05', 'Matt', '(613)624-9393', '93 Holland Avenue, Ottawa, ON K1Y0Y1', '10:00:00', '22:00:00', '00005');
INSERT INTO LOCATION
VALUES ('00006', '2009-06-26', 'Jeff', '(613)429-3614', '429 Richmond Road, Ottawa, ON K2A 4E4', '09:00:00', '23:00:00', '00006');
INSERT INTO LOCATION
VALUES ('00007', '2010-07-17', 'Geoffrey', '(613)373-1951', '195 Bank Street, Ottawa, ON K2P 1W7', '08:00:00', '22:30:00', '00007');
INSERT INTO LOCATION
VALUES ('00008', '2011-08-08', 'Sam', '(613)735-5673', '5673 Osgoode Main Street, Ottawa, ON K0A 2W0', '09:00:00', '21:00:00', '00008');
INSERT INTO LOCATION
VALUES ('00009', '2012-09-29', 'Alex', '(613)754-7437', '525 Industrial Avenue, Unit 5, Ottawa, ON K1G 3S2', '10:00:00', '22:00:00', '00009');
INSERT INTO LOCATION
VALUES ('00010', '2013-10-01', 'Jeffrey', '(613)987-1453', '969 Wellington Street West, Ottawa, ON K1Y 2Y1', '11:00:00', '23:00:00', '00010');
INSERT INTO LOCATION
VALUES ('00011', '2014-11-11', 'Will', '(613)476-4356', '2950 Bank Street, Unit 7, Ottawa, ON K1T 1N8', '10:00:00', '22:00:00', '00011');
INSERT INTO LOCATION
VALUES ('00012', '2015-12-21', 'Liam', '(613)435-2345', '700 Sussex Drive, Ottawa, ON K1N 1K4', '09:00:00', '21:30:00', '00012');


/* 48 menu items */

-- The Works
INSERT INTO MENUITEM
VALUES ('0001', 'Chicken Fight Club', 'Food', 'Main', 'Cajun dusted chicken breast, fried & topped with chedder cheese, bacon, lettuce, tomato and our signature Beechhouse sauce.', 14.53, '00001');
INSERT INTO MENUITEM
VALUES ('0002', 'Crispy Dills', 'Food', 'Starter', 'Breaded dills, deep fried to a crisp. Server with your choice of dipstick.', 9.98, '00001');
INSERT INTO MENUITEM
VALUES ('0003', 'Root 66 Shake', 'Beverage', 'Beverage', 'Are you gunna go our way with a root beer shake with root beer, creamy Canadian valilla ice cream, topped with whipped cream, oreo cookie crumble & garnished with an old-fashioned root beer candy stick.', 7.91, '00001');
INSERT INTO MENUITEM
VALUES ('0004', 'Cookie Monster', 'Food', 'Dessert', ' Chocolate chip cookies, vanilla ice cream, chocolate sauce and whipped cream.', 4.97, '00001');
INSERT INTO MENUITEM
VALUES ('0005', 'Crappy Tire', 'Food', 'Main', 'Grilled pineapple ring, sweet & spicy sauce & brie cheese(Canadian Tire $ accepted).', 13.27, '00001');

-- Moose McGuires
INSERT INTO MENUITEM
VALUES ('0006', 'Grilled Chicken Sandwich', 'Food', 'Main', 'Our marinated chicken breast with crispy bacon, mixed greens, tomatoes and pesto mayo on a fresh ciabatta bun.', 14.00, '00002');
INSERT INTO MENUITEM
VALUES ('0007', 'Potato Skina', 'Food', 'Starter', 'Russet potato skins stuffed with bacon, cheese, green onions and tomatoes. Served with salsa and sour cream.', 10.00, '00002');
INSERT INTO MENUITEM
VALUES ('0008', 'Chicken Souvlaki', 'Food', 'Main', 'Two skevers of marinated chicken breast serves with a Greek salad and warm flatbread.', 14.50, '00002');
INSERT INTO MENUITEM
VALUES ('0009', 'Canadian Pizza(15")', 'Food', 'Main', 'Bacon, mushrooms, pepperoni, smoked ham, chedder and mozzarella cheese with ranch and pizza sauce.', 25.00, '00002');
INSERT INTO MENUITEM
VALUES ('0010', 'Canadian Pizza(7")', 'Food', 'Main', 'Bacon, mushrooms, pepperoni, smoked ham, chedder and mozzarella cheese with ranch and pizza sauce.', 13.00, '00002');

-- Central Bierhaus
INSERT INTO MENUITEM
VALUES ('0011', 'Fish & Potato Cakes', 'Food', 'Starter', 'Haddock, potato, apple fennel slaw, classic tartar.', 11.00, '00003');
INSERT INTO MENUITEM
VALUES ('0012', 'Beef Short Rib', 'Food', 'Main', 'Roasted fingerling potato, wilted freens, pickled carrots.', 24.00, '00003');
INSERT INTO MENUITEM
VALUES ('0013', 'Seared Artic Char', 'Food', 'Main', 'Sweet potato, pepper, cabbage hash, mapple mustard glaze.', 20.00, '00003');
INSERT INTO MENUITEM
VALUES ('0014', 'Lobster Poutine', 'Food', 'Main', 'House chipped fries, cheese curds, lobster, bisque.', 14.00, '00003');

-- Saigon Boy Noodle House
INSERT INTO MENUITEM
VALUES ('0015', 'Shrimp Spring Roll', 'Food', 'Starter', 'description', 5.00, '00004');
INSERT INTO MENUITEM
VALUES ('0016', 'Shrimp Summer Roll', 'Food', 'Starter', 'description', 5.00, '00004');
INSERT INTO MENUITEM
VALUES ('0017', 'Don Noodle with Seafood', 'Food', 'Main', 'Shrimp, Squid, Fish Cake, Crab', 8.75, '00004');
INSERT INTO MENUITEM
VALUES ('0018', 'Coffee with Condensed Milk', 'Beverage', 'Beverage', '', 3.95, '00004');
INSERT INTO MENUITEM
VALUES ('0019', 'Red Bull', 'Beverage', 'Beverage', '', 3.50, '00004');
INSERT INTO MENUITEM
VALUES ('0020', 'Green Tea|Coconut|Ginger|Mango', 'Beverage', 'Dessert', '', 4.25, '00004');
INSERT INTO MENUITEM
VALUES ('0021', 'Vanilla Ice Cream topped with peanuts', 'Food', 'Dessert', '', 3.25, '00004');

-- The Soca Kitchen
INSERT INTO MENUITEM
VALUES ('0022', 'Soup of the Day', 'Food', 'Starter', 'Local farm fresh produce', 5.00, '00005');
INSERT INTO MENUITEM
VALUES ('0023', 'Duo tacos', 'Food', 'Main', 'Pineapple, homemade hot sauce, pickled unions', 14.00, '00005');
INSERT INTO MENUITEM
VALUES ('0024', 'Seafood tower', 'Food', 'Main', 'Oysters, lobster tail, musset escabeche, coctail shrimp', 69.00, '00005');
INSERT INTO MENUITEM
VALUES ('0025', 'Plate Grandes', 'Food', 'Main', 'charred cauliflower "steak"', 24.00, '00005');
INSERT INTO MENUITEM
VALUES ('0026', 'Plate X-Grande', 'Food', 'Main', 'X large strip loin steak, home made black garlic mashed potatoes, hazelnut, salad. For two.', 76.00, '00005');

-- MHK Sushi
INSERT INTO MENUITEM
VALUES ('0027', 'Gyoza', 'Food', 'Starter', 'Beef dumpling(5pcs)', 5.00, '00006');
INSERT INTO MENUITEM
VALUES ('0028', 'Sushi Lunch', 'Food', 'Main', '6 assorted Nigiri and 6 pieces of Maki', 13.00, '00006');
INSERT INTO MENUITEM
VALUES ('0029', 'MHK Maki Platter', 'Food', 'Main', 'Chefs special Maki, Hawaiian Maki, and Japanese bagel Maki.', 20.00, '00006');
INSERT INTO MENUITEM
VALUES ('0030', 'Dragon Roll', 'Food', 'Main', 'Eel, cucumber and mayo, avocado, smelt roe and eel sauce.', 13.00, '00006');
INSERT INTO MENUITEM
VALUES ('0031', 'Volcano Roll', 'Food', 'Main', 'California Roll with avocado slices, baked octopus and spicy house sauce on top.', 12.00, '00006');

-- Bread and Sons Bakery
INSERT INTO MENUITEM
VALUES ('0032', 'Franks Wild Years', 'Food', 'Pizza', 'Cherry, Roma, Sun dried, Roasted Garlic, Feta', 14.00, '00007');
INSERT INTO MENUITEM
VALUES ('0033', 'The Boss', 'Food', 'Pizza', 'Bocconcini, Cherry Tomatoes, Argula, Roasted Garlic', 14.00, '00007');
INSERT INTO MENUITEM
VALUES ('0034', 'Espresso', 'Drink', 'Coffee', '', 2.81, '00007');
INSERT INTO MENUITEM
VALUES ('0035', 'Cappuccino', 'Drink', 'Coffee', '', 3.33, '00007');

-- The Red Dot
INSERT INTO MENUITEM
VALUES ('0036', 'Bruscetta', 'Food', 'Appetizers', 'French baguette topped with chopped tomatoes, garlic, basil and olive oil ', 9.00, '00008');
INSERT INTO MENUITEM
VALUES ('0037', 'Chicken Taco Salad', 'Food', 'Salads', 'Romaine lettuce, tomatoes, cheese, green onions, olives and corn chips topped with house guacamole and ranch dressing ', 11.00, '00008');
INSERT INTO MENUITEM
VALUES ('0038', 'Jambalaya Penne', 'Food', 'Pasta', 'Chicken, shrimp, and andouille sausage tossed with Creole cream sauce', 13.00, '00008');
INSERT INTO MENUITEM
VALUES ('0039', 'The Red Dot Club', 'Food', 'Burgers', 'Toasted Ciabatta with chicken, bacon, ham, tomatoes, lettuce and mayo', 13.00, '00008');

-- Five Guys
INSERT INTO MENUITEM
VALUES ('0040', 'Bacon Cheeseburger', 'Food', 'Burger', 'Two hand-formed patties, grilled to order - with two strips of crispy bacon and two slices of Kraft American cheese – all on a soft, sesame seed bun.', 7.75, '00009');
INSERT INTO MENUITEM
VALUES ('0041', 'Veggie Sandwich', 'Food', 'Sandwiches', 'Freshly grilled onions, mushrooms, and green peppers, layered with lettuce and tomatoes, on a soft toasted bun. Or, start with the bun and build your own from scratch. Not a veggie burger.', 6.85, '00009');
INSERT INTO MENUITEM
VALUES ('0042', 'Cajun Style Fries', 'Food', 'Fries', 'Made to order Five Guys boardwalk style fries, with a heavy dose of Cajun spices. Unsure? Get the seasoning on the side.', 4.00, '00009');
INSERT INTO MENUITEM
VALUES ('0043', 'Strawberry Milkshake', 'Drink', 'Milkshakes', 'Fresh strawberries in homemade simple syrup.', 5.00, '00009');

-- SuzyQ
INSERT INTO MENUITEM
VALUES ('0044', 'Blue Vanilla Fruit Loop (6)', 'Food', 'Doughnut', 'The Blue Vanilla Fruit Loop delivers exactly what it promises, a sky blue vanilla bean glaze topped with toasted fruit loops. It looks like the kind of doughnut a Care Bear would make, but it’s suitable for children of all ages.', 12.00, '00010');
INSERT INTO MENUITEM
VALUES ('0045', 'Cookies and Cream (6)', 'Food', 'Doughnut', 'Cookies & Cream has a vanilla glaze and homemade cookie crumb on top. It is very similar to a cookie that, for legal reasons, we are not allowed to identify by name. Goes great with a bottle of milk.', 12.00, '00010');
INSERT INTO MENUITEM
VALUES ('0046', 'Salty Caramel', 'Food', 'Doughnut', 'We start with our caramel, homemade in a copper pot to ensure it’s cooked to perfection. From there we add a sprinkle of fleur de sel, hand harvested off the coast of Vancouver Island. The end result is an extra sticky, extra delicious mix of sweet and savoury.', 12.00, '00010');
INSERT INTO MENUITEM
VALUES ('0047', 'Dirty Chocolate', 'Food', 'Doughnut', 'A classic dark chocolate glaze made dirty with a generous helping of our homemade chocolate cookie crumb.', 12.00, '00010');

-- Kallisto
INSERT INTO MENUITEM
VALUES ('0048', 'Kallisto Poutine', 'Food', 'Poutine', 'Feta & cheddar cheese', 11.00, '00011');
INSERT INTO MENUITEM
VALUES ('0049', 'Greek Salad', 'Food', 'Salads', 'Crispy romaine, feta cheese, tomato, cucumber, red onion, red pepper, Kalamata olives with special Kallisto special house dressing', 10.00, '00011');
INSERT INTO MENUITEM
VALUES ('0050', 'Kallisto burger', 'Food', 'Burgers', 'Grilled burger with lettuce, tomato, sauteed onion and mushroom', 13.00, '00011');
INSERT INTO MENUITEM
VALUES ('0051', 'Loukaniko', 'Food', 'Appetizers', 'Tasty sausages lightly pan roasted, with diced tomatoes, garlic, onion and red wine sauce', 12.00, '00011');

-- Milestones
INSERT INTO MENUITEM
VALUES ('0052', 'Mediterranean Goat Cheese Platter', 'Food', 'Starter', 'Warm goat cheese topped with red pepper relish. Served with toasted focaccia bread, fig jam and roasted garlic', 13.75, '00012');
INSERT INTO MENUITEM
VALUES ('0053', 'Roasted Garlic Caesar Salad', 'Food', 'Salads', 'Romaine lettuce and baby kale, tossed with smoked bacon, Parmesan cheese, focaccia croutons and our signature Caesar dressing', 10.75, '00012');
INSERT INTO MENUITEM
VALUES ('0054', 'Stacked Chicken Parmesan', 'Food', 'Mains', 'Crispy panko and Asiago fried chicken breast, mozzarella cheese, roasted tomato chutney and fresh basil. Served with seasonal vegetables and vermicelli noodles tossed in a basil pesto cream sauce', 21.00, '00012');
INSERT INTO MENUITEM
VALUES ('0055', 'Miso Glazed Cod', 'Food', 'Mains', 'Pan seared wild Norwegian cod brushed with a red miso glaze. Served with jasmine rice, coconut lemon broth, spinach, kale, grape tomatoes and roasted red onions', 25.75, '00012');


/* 8 ratings per restaurant */

-- The Works
INSERT INTO RATING
VALUES ('00001', '00031', '2016-6-23', 3, 4, 3, 5, 'This place had a lot of heart. The appetizers must be sprinkled with crack because I just craved for more and more. I want to hire their decorator to furnish my apartment. The food was cooked to perfection. The waiter was prompt and polite. I had a satisfactory experience and will have to try it again.', '00001');
INSERT INTO RATING
VALUES ('00002', '00032', '2006-8-14', 4, 4, 2, 4, 'I stumbled on this undiscovered gem right in our neighboorhood. Everything was mostly decadent. I want to hire their decorator to furnish my apartment. It failed to meet the 5-star experience because the waitress had really bad body odor.', '00001');
INSERT INTO RATING
VALUES ('00003', '00033', '2015-10-27', 4, 4, 3, 5, 'I was pleasantly surprised. The entrees are simply to die for. The ambiance gives off an earthy feel-good vibe. I was happy to see how clean everything was. Everything was just so yummy. I had a satisfactory experience and will have to try it again.', '00001');
INSERT INTO RATING
VALUES ('00004', '00034', '2010-3-7', 4, 3, 3, 5, 'It was much better than I expected. I found the entrees to be very agreeable to my personal flavor-profile. Everything was just so yummy. I would have rated this higher, but the waitress made a pass at me. So inappropriate.', '00001');
INSERT INTO RATING
VALUES ('00005', '00035', '2005-1-16', 4, 2, 3, 4, 'This place had a lot of heart. The decor was unique and incredible. The waitress did an excellent job. Solid 4 stars.', '00001');
INSERT INTO RATING
VALUES ('00006', '00036', '2017-6-19', 4, 2, 5, 5, 'This is one of my favorite places. Everything was just so yummy. Try out the huge selection of incredible appetizers. The food was flavorful, savory, and succulent. They got a new customer for life!', '00001');
INSERT INTO RATING
VALUES ('00007', '00037', '2018-3-21', 3, 4, 3, 5, 'I was pleasantly surprised. I found the ambiance to be very charming. I was happy to see how clean everything was. Make sure to save room for dessert, because that was the best part of the meal! Try out the huge selection of incredible appetizers. I would have rated this higher, but the waitress kept looking at me funny the whole time.', '00001');
INSERT INTO RATING
VALUES ('00008', '00038', '2011-8-30', 5, 5, 3, 5, 'Oh! My! God! So yummy! The food was cooked to perfection. The waitress was prompt and polite. Everything was just so yummy. Make sure to save room for dessert, because that was the best part of the meal! They got a new customer for life!', '00001');
INSERT INTO RATING
VALUES ('00009', '00039', '2009-12-1', 4, 4, 3, 5, 'I stumbled on this undiscovered gem right in our neighboorhood. The waitress was prompt and polite. Try out the huge selection of incredible appetizers. The food was flavorful, savory, and succulent. Make sure to save room for dessert, because that was the best part of the meal! I had a satisfactory experience and will have to try it again.', '00001');
INSERT INTO RATING
VALUES ('00010', '00040', '2005-5-4', 4, 1, 3, 2, 'This place was nearby and I decided to check it out. After my meal, I was knocked into a food coma. Everything was mostly decadent. Solid 4 stars.', '00001');

-- Moose McGuires
INSERT INTO RATING
VALUES ('00011', '00041', '2005-2-23', 1, 2, 3, 2, 'I really wanted to like this place. The whole place was just dirty. The photos of the food were appetizing and palpable, but didnt live up to the hype. Too many things on the menu look like crap, smell like crap, and taste like crap. I would be hard pressed to come back.', '00002');
INSERT INTO RATING
VALUES ('00012', '00042', '2010-5-10', 2, 3, 2, 1, 'I had high hopes for this place. Seriously, how difficult is it to get a clean glass around here? Everything tasted either microwaved or straight from a can. The waitress was nothing remarkable. Meh.', '00002');
INSERT INTO RATING
VALUES ('00013', '00043', '2006-7-13', 2, 1, 3, 2, 'I felt like this place wasnt trying hard enough. The food was all right but seriously lacked presentation. Everything tasted either microwaved or straight from a can. Too many things on the menu look like crap, smell like crap, and taste like crap. I would be hard pressed to come back.', '00002');
INSERT INTO RATING
VALUES ('00014', '00044', '2008-2-7', 1, 3, 1, 3, 'This place was just ok. Everything tasted either microwaved or straight from a can. The menu didnt match the one on their website. I had a less than satisfactory experience and will probably not be here again.', '00002');
INSERT INTO RATING
VALUES ('00015', '00045', '2008-5-29', 1, 1, 1, 1, 'I can summarize my visit in one word: Terrible. My water glass was stained with lipstick and had bits of food floating in it. I asked for my steak medium, but it was frozen in the center. Even Chef Boyardee would be disgusted by this sorry attempt at a meal. Overhyped. Wild horses couldnt drag me back here.', '00002');
INSERT INTO RATING
VALUES ('00016', '00031', '2016-9-30', 1, 1, 1, 2, 'I really wanted to like this place. There were bits of food stuck to my silverware. The kitchen screwed up my order completely, mixing it up with someone elses. It took almost an hour to get it corrected! The service was terrible. The waiter was very air-headed. This food will start the zombie apocalypse. Stay away!', '00002');
INSERT INTO RATING
VALUES ('00017', '00032', '2017-12-7', 1, 3, 3, 1, 'Meh. Too many things on the menu look like crap, smell like crap, and taste like crap. The burger was undercooked. They need to get their act together before I set foot in this place again.', '00002');
INSERT INTO RATING
VALUES ('00018', '00033', '2013-10-1', 4, 5, 3, 2, 'It was much better than I expected. The waiter was prompt and polite. The entree I had was sublime. It could have been perfect, but my wine glass was dirty.', '00002');
INSERT INTO RATING
VALUES ('00019', '00035', '2009-5-16', 1, 2, 3, 2, 'I felt like this place wasnt trying at all. The tofu dish tasted spongy and a bit bland. I felt the prices were too high given the quality of the food. The service wasnt that good and the waiter was air-headed. Seriously, how difficult is it to get a clean glass around here? Meh.', '00002');

-- Central Bierhaus
INSERT INTO RATING
VALUES ('00020', '00036', '2006-9-17', 3, 3, 3, 4, 'This place was just ok. The chicken was a little dry. Overhyped. I felt the prices were too high given the quality of the food. The waitress was nothing remarkable. This place deserves its very average rating.', '00003');
INSERT INTO RATING
VALUES ('00021', '00037', '2008-10-17', 3, 2, 3, 2, 'This place was nearby and I decided to check it out. The service wasnt that good and the waiter was tired. I felt the prices were too high given the quality of the food. Might be back. Time will tell.', '00003');
INSERT INTO RATING
VALUES ('00022', '00038', '2009-3-17', 2, 3, 4, 3, 'When I walked in, I really wasnt expecting much. The photos of the food were appetizing and palpable, but didnt live up to the hype. The service wasnt that good and the waitress was tired. ', '00003');
INSERT INTO RATING
VALUES ('00023', '00039', '2010-7-17', 4, 2, 3, 3, 'Im torn about this place. There were a lot of interesting decorations on the walls. I felt the prices were too high given the quality of the food. I was not very pleased to find out that the coffee wasnt organic. Satisfactory experience, will come again.', '00003');
INSERT INTO RATING
VALUES ('00024', '00040', '2011-5-17', 4, 4, 3, 4, 'I felt like this place was trying too hard. The waitress was barely there. Satisfactory experience, will come again.', '00003');
INSERT INTO RATING
VALUES ('00025', '00041', '2012-12-17', 4, 5, 2, 3, 'I stumbled on this undiscovered gem right in our neighboorhood. The ambiance gives off an earthy feel-good vibe. I found the entrees to be very agreeable to my personal flavor-profile.', '00003');
INSERT INTO RATING
VALUES ('00026', '00042', '2013-1-17', 2, 1, 3, 2, 'Bleh. The fish was dry. I felt the prices were too high given the quality of the food. I was not very pleased to find out that the coffee wasnt organic. This place is very dumpy and in a serious need of a fresh paint job. 2 stars.', '00003');
INSERT INTO RATING
VALUES ('00027', '00043', '2015-6-17', 5, 4, 2, 3, 'It was much better than I expected. The chicken was a little dry. The waitress was prompt and polite. I was happy to see how clean everything was. The ambiance gives off an earthy feel-good vibe. Satisfactory experience, will come again.', '00003');
INSERT INTO RATING
VALUES ('00028', '00044', '2017-2-17', 3, 3, 3, 2, 'This place had a lot of heart. Everything was just so yummy. The food was flavorful, savory, and succulent. I had a satisfactory experience and will have to try it again.', '00003');

-- Saigon Boy Noodle House
INSERT INTO RATING
VALUES ('00029', '00045', '2007-9-17', 2, 5, 4, 2, 'I felt like this place wasnt trying hard enough. The steak was a little dry.', '00004');
INSERT INTO RATING
VALUES ('00030', '00044', '2016-5-17', 2, 1, 2, 4, 'This place was nearby and I decided to check it out. I felt the prices were too high given the quality of the food. The service was good for the most part but the waitress was a bit air-headed.', '00004');
INSERT INTO RATING
VALUES ('00031', '00043', '2012-2-17', 1, 2, 3, 4, 'I felt like this place was trying too hard. The ambiance gives off an earthy feel-good vibe. I found the entrees to be somewhat agreeable to my personal flavor-profile. I would probably come back more often if the service was better.', '00004');
INSERT INTO RATING
VALUES ('00032', '00031', '2010-5-17', 1, 3, 1, 3, 'I have been here several times before. Overhyped. I was not very pleased to find out that the coffee wasnt organic.', '00004');
INSERT INTO RATING
VALUES ('00033', '00032', '2009-3-17', 3, 3, 3, 5, 'This place had a lot of heart. I found the entrees to be somewhat agreeable to my personal flavor-profile. Some of my favorite dishes are no longer available. The service was good for the most part but the waiter was a bit tired.', '00004');
INSERT INTO RATING
VALUES ('00034', '00033', '2008-12-17', 5, 1, 3, 1, 'There were a lot of interesting decorations on the walls.', '00004');
INSERT INTO RATING
VALUES ('00035', '00034', '2014-11-17', 1, 3, 4, 1, 'The whole place was just dirty. I heard a rumor that the vegetarian dishes are prepared alongside the meat.', '00004');
INSERT INTO RATING
VALUES ('00036', '00036', '2011-8-17', 4, 1, 1, 4, 'Im torn about this place. Overhyped. The waiter was barely there.', '00004');
INSERT INTO RATING
VALUES ('00037', '00037', '2008-4-17', 1, 4, 4, 5, 'Some of my favorite dishes are no longer available.', '00004');
INSERT INTO RATING
VALUES ('00038', '00039', '2017-8-17', 3, 5, 5, 3, 'Best experience ever! The decor was unique and incredible. The waiter did an excellent job. Im definitely coming back for more!', '00004');

-- The Soca Kitchen
INSERT INTO RATING
VALUES ('00039', '00041', '2008-10-17', 4, 4, 3, 1, 'The menu didnt match the one on their website.', '00005');
INSERT INTO RATING
VALUES ('00040', '00039', '2009-5-17', 1, 1, 4, 5, 'I asked for my steak medium-rare, but it was still cold.', '00005');
INSERT INTO RATING
VALUES ('00041', '00037', '2011-3-17', 5, 2, 4, 5, 'There were a lot of interesting decorations on the walls.', '00005');
INSERT INTO RATING
VALUES ('00042', '00036', '2010-2-17', 5, 3, 3, 4, 'I have been here several times before. Overhyped. I was not very pleased to find out that the coffee wasnt organic.', '00005');
INSERT INTO RATING
VALUES ('00043', '00035', '2012-6-17', 1, 2, 4, 1, 'I asked for my steak medium-rare, but it was still cold.', '00005');
INSERT INTO RATING
VALUES ('00044', '00034', '2013-12-17', 4, 4, 5, 2, 'The menu didnt match the one on their website.', '00005');
INSERT INTO RATING
VALUES ('00045', '00033', '2014-7-17', 1, 4, 4, 1, 'There were bits of food stuck to my silverware.', '00005');
INSERT INTO RATING
VALUES ('00046', '00032', '2015-3-17', 4, 2, 3, 5, 'I felt like this place wasnt trying hard enough. The steak was a little dry. ', '00005');
INSERT INTO RATING
VALUES ('00047', '00031', '2017-8-17', 5, 4, 4, 3, 'The desserts must be sprinkled with crack because I just craved for more and more. Everything was just so yummy.', '00005');

-- MHK Sushi
INSERT INTO RATING
VALUES ('00048', '00031', '2009-9-17', 3, 3, 4, 5, 'This is one of my favorite places. The decor was unique and incredible. The food was cooked to perfection. Everything I tried was bursting with flavor.', '00006');
INSERT INTO RATING
VALUES ('00049', '00032', '2010-1-17', 5, 3, 4, 4, 'Yummers! I found the ambiance to be very charming. This was one of the best mouth-watering steaks Ive had grace my taste buds in a long time. Everything was just so yummy. The waitress did an excellent job. This is definitely a spot Ill be frequenting.', '00006');
INSERT INTO RATING
VALUES ('00050', '00033', '2017-3-17', 3, 5, 4, 5, 'My taste buds are still dancing from our last visit! The food was cooked to perfection. The waiter did an excellent job. Everything I tried was bursting with flavor. Everything was just so yummy.', '00006');
INSERT INTO RATING
VALUES ('00051', '00034', '2017-4-17', 4, 5, 5, 4, 'I stumbled on this undiscovered gem right in our neighboorhood. The food was cooked to perfection. After my meal, I was knocked into a food coma. I want to hire their decorator to furnish my apartment. The waiter was prompt and polite.', '00006');
INSERT INTO RATING
VALUES ('00052', '00035', '2016-5-17', 5, 4, 4, 5, 'OMG! So good! Make sure to save room for dessert, because that was the best part of the meal! I found the ambiance to be very charming. Try out the huge selection of incredible appetizers.', '00006');
INSERT INTO RATING
VALUES ('00053', '00036', '2015-8-17', 5, 4, 4, 3, 'Best experience ever! The entrees are simply to die for. Try out the huge selection of incredible appetizers. I want to hire their decorator to furnish my apartment.', '00006');
INSERT INTO RATING
VALUES ('00054', '00037', '2013-6-17', 5, 5, 5, 5, 'I stumbled on this undiscovered gem right in our neighboorhood. The food was flavorful, savory, and succulent. Everything was just so yummy. Id give more than 5 stars if I could!', '00006');
INSERT INTO RATING
VALUES ('00055', '00038', '2012-8-17', 4, 4, 5, 5, 'Best experience ever! The decor was unique and incredible. Everything from the starters to the entrees to the desserts meshed perfectly with my flavor-profile. After my meal, I was knocked into a food coma.', '00006');
INSERT INTO RATING
VALUES ('00056', '00039', '2011-12-17', 4, 3, 5, 4, 'I stumbled on this undiscovered gem right in our neighboorhood. This was one of the best mouth-watering steaks Ive had grace my taste buds in a long time. The waiter was prompt and polite. The decor was unique and incredible.', '00006');
INSERT INTO RATING
VALUES ('00057', '00043', '2012-10-17', 4, 5, 3, 5, 'I stumbled on this undiscovered gem right in our neighboorhood. The service was good for the most part but the waiter was a bit clueless. The decor was unique and incredible. The entree I had was sublime. I was happy to see how clean everything was.', '00006');

-- Bread and Sons Bakery
INSERT INTO RATING
VALUES ('00058', '00031', '2010-12-17', 2, 4, 1, 5, 'This place had a lot of heart. The entree I had was sublime. The waitress was barely there. The ambiance gives off an earthy feel-good vibe. ', '00007');
INSERT INTO RATING
VALUES ('00059', '00032', '2010-11-17', 3, 1, 3, 3, 'I felt like this place was trying too hard. The ambiance gives off an earthy feel-good vibe. Some of my favorite dishes are no longer available. This place deserves its very average rating.', '00007');
INSERT INTO RATING
VALUES ('00060', '00033', '2011-4-17', 2, 2, 5, 2, 'I had high hopes for this place. I was not very pleased to find out that the coffee wasnt organic. The steak was a little dry.', '00007');
INSERT INTO RATING
VALUES ('00061', '00034', '2012-6-17', 3, 1, 4, 4, 'The waiter was nothing remarkable. Overall, this place is just okay.', '00007');
INSERT INTO RATING
VALUES ('00062', '00035', '2013-9-17', 2, 1, 3, 4, 'I have been here several times before. Overhyped. I was not very pleased to find out that the coffee wasnt organic.', '00007');
INSERT INTO RATING
VALUES ('00063', '00036', '2014-2-17', 3, 4, 2, 3, 'This place was just ok. Overhyped. The chicken was a little dry. The waiter was barely there. Might be back. Time will tell.', '00007');
INSERT INTO RATING
VALUES ('00064', '00037', '2015-1-17', 1, 2, 1, 5, 'I felt the prices were too high given the quality of the food.', '00007');
INSERT INTO RATING
VALUES ('00065', '00038', '2015-4-17', 5, 1, 4, 1, 'There were a lot of interesting decorations on the walls.', '00007');

-- The Red Dot
INSERT INTO RATING
VALUES ('00066', '00031', '2011-12-17', 1, 4, 4, 5, 'I felt the prices were too high given the quality of the food.', '00008');
INSERT INTO RATING
VALUES ('00067', '00032', '2012-3-17', 5, 1, 2, 4, 'The waiter did an excellent job.', '00008');
INSERT INTO RATING
VALUES ('00068', '00033', '2013-4-17', 4, 1, 5, 4, 'This place had a lot of heart. The entree I had was sublime. The waitress was barely there. The ambiance gives off an earthy feel-good vibe. ', '00008');
INSERT INTO RATING
VALUES ('00069', '00034', '2014-5-17', 5, 5, 4, 3, 'After my meal, I was knocked into a food coma.', '00008');
INSERT INTO RATING
VALUES ('00070', '00035', '2015-5-17', 3, 5, 2, 1, 'I felt like this place wasnt trying hard enough. The steak was a little dry.', '00008');
INSERT INTO RATING
VALUES ('00071', '00036', '2016-6-17', 2, 1, 4, 1, 'I had high hopes for this place. I was not very pleased to find out that the coffee wasnt organic. The steak was a little dry.', '00008');
INSERT INTO RATING
VALUES ('00072', '00037', '2017-7-17', 5, 3, 5, 2, 'Everything from the starters to the entrees to the desserts meshed perfectly with my flavor-profile.', '00008');
INSERT INTO RATING
VALUES ('00073', '00038', '2017-8-17', 3, 1, 1, 4, 'I felt like this place was trying too hard. The ambiance gives off an earthy feel-good vibe. Some of my favorite dishes are no longer available. This place deserves its very average rating.', '00008');

-- Five Guys
INSERT INTO RATING
VALUES ('00074', '00031', '2012-9-17', 1, 2, 4, 3, 'This place was just ok. Overhyped. The chicken was a little dry. The waiter was barely there. Might be back. Time will tell.', '00009');
INSERT INTO RATING
VALUES ('00075', '00032', '2013-8-17', 5, 3, 5, 2, 'I want to hire their decorator to furnish my house.', '00009');
INSERT INTO RATING
VALUES ('00076', '00033', '2014-7-17', 2, 4, 5, 5, 'There were a lot of interesting decorations on the walls.', '00009');
INSERT INTO RATING
VALUES ('00077', '00034', '2014-6-17', 1, 2, 5, 1, 'I have been here several times before. Overhyped. I was not very pleased to find out that the coffee wasnt organic.', '00009');
INSERT INTO RATING
VALUES ('00078', '00035', '2015-5-17', 3, 4, 2, 2, 'The waiter was nothing remarkable. Overall, this place is just okay.', '00009');
INSERT INTO RATING
VALUES ('00079', '00036', '2016-4-17', 3, 1, 4, 3, 'I felt like this place was trying too hard. The ambiance gives off an earthy feel-good vibe. Some of my favorite dishes are no longer available. This place deserves its very average rating.', '00009');
INSERT INTO RATING
VALUES ('00080', '00037', '2017-3-17', 5, 5, 4, 5, 'OMG! So awesome! The waiter did an excellent job. I found the ambiance to be very charming. This is definitely a spot Ill be frequenting.', '00009');
INSERT INTO RATING
VALUES ('00081', '00038', '2017-2-17', 4, 1, 1, 4, 'Try out the huge selection of incredible appetizers. Satisfactory experience, will come again.', '00009');

-- SuzyQ
INSERT INTO RATING
VALUES ('00082', '00031', '2014-12-17', 2, 1, 5, 4, 'I felt the prices were too high given the quality of the food.', '00010');
INSERT INTO RATING
VALUES ('00083', '00032', '2015-3-17', 1, 1, 3, 2, 'Dreadful place. Eating here is like playing Russian Roulette, only you have a 5 out of 6 chance of getting food poisoning.', '00010');
INSERT INTO RATING
VALUES ('00084', '00033', '2015-4-17', 2, 3, 3, 3, 'This place had a lot of heart. The entree I had was sublime. The waitress was barely there. The ambiance gives off an earthy feel-good vibe. ', '00010');
INSERT INTO RATING
VALUES ('00085', '00034', '2014-5-17', 3, 3, 3, 2, 'Im torn about this place. The chicken was a little dry. I felt the prices were too high given the quality of the food. The service was good for the most part but the waitress was a bit rude. Overall, this place is just soso. I could come back.', '00010');
INSERT INTO RATING
VALUES ('00086', '00035', '2017-7-17', 2, 4, 3, 5, 'This place was just ok. Overhyped. The chicken was a little dry. The waiter was barely there. Might be back. Time will tell.', '00010');
INSERT INTO RATING
VALUES ('00087', '00036', '2016-8-17', 1, 4, 3, 2, 'When I walked in, I really wasnt expecting much. I heard a rumor that the vegetarian dishes are prepared alongside the meat. The ambiance gives off an earthy feel-good vibe. The tofu dish tasted spongy and a bit bland. The waitress was barely there. I would be hard pressed to come back.', '00010');
INSERT INTO RATING
VALUES ('00088', '00037', '2015-9-17', 2, 3, 3, 5, 'I felt like this place was trying too hard. The ambiance gives off an earthy feelgood vibe. Some of my favorite dishes are no longer available. This place deserves its very average rating.', '00010');
INSERT INTO RATING
VALUES ('00089', '00038', '2014-10-17', 3, 2, 3, 2, 'I felt like this place wasnt trying hard enough. The steak was a little dry. ', '00010');

-- Kallisto
INSERT INTO RATING
VALUES ('00090', '00031', '2015-8-17', 3, 2, 3, 4, 'Decent place. The entree I had was sublime. The ambiance gives off an earthy feel-good vibe.', '00011');
INSERT INTO RATING
VALUES ('00091', '00032', '2016-7-17', 1, 4, 3, 2, 'I have been here several times before! Overhyped. I was not very pleased to find out that the coffee wasnt organic.', '00011');
INSERT INTO RATING
VALUES ('00092', '00033', '2017-6-17', 1, 1, 2, 2, 'I am never coming back here! Seriously, how difficult is it to get a clean glass around here?', '00011');
INSERT INTO RATING
VALUES ('00093', '00034', '2016-4-17', 5, 5, 4, 2, 'Yummers! The food is simply to die for', '00011');
INSERT INTO RATING
VALUES ('00094', '00035', '2015-3-17', 2, 3, 1, 5, 'I felt the prices were too high given the quality of the food.', '00011');
INSERT INTO RATING
VALUES ('00095', '00036', '2017-2-17', 2, 2, 1, 2, 'I had high hopes for this place. I was not very pleased to find out that the coffee wasnt organic. The steak was a little dry.', '00011');
INSERT INTO RATING
VALUES ('00096', '00037', '2016-1-17', 1, 1, 1, 1, 'Terrible! I threw up in my mouth a little when they brought me my food. Too many things on the menu look like crap, smell like crap, and taste like crap. The service was terrible. The waiter was very airheaded. I wish I could put a sign out front that said "DONT COME HERE!"', '00011');
INSERT INTO RATING
VALUES ('00097', '00038', '2015-12-17', 5, 4, 3, 2, 'It was much better than I expected. The decor was unique and incredible. The entrees are simply to die for.', '00011');

-- Milestones
INSERT INTO RATING
VALUES ('00098', '00031', '2016-4-17', 2, 3, 2, 5, 'I felt like this place wasnt trying hard enough. The steak was a little dry. ', '00012');
INSERT INTO RATING
VALUES ('00099', '00032', '2016-5-17', 3, 2, 3, 3, 'I had high hopes for this place. I was not very pleased to find out that the coffee wasnt organic. The steak was a little dry.', '00012');
INSERT INTO RATING
VALUES ('00100', '00033', '2017-6-17', 2, 5, 4, 5, 'I felt the prices were too high given the quality of the food.', '00012');
INSERT INTO RATING
VALUES ('00101', '00034', '2016-7-17', 3, 4, 5, 3, 'I had high hopes for this place and I was not disapointed.', '00012');
INSERT INTO RATING
VALUES ('00102', '00035', '2017-8-17', 4, 5, 3, 4, 'Not the best, but certainly not the worst.  Would come back.', '00012');
INSERT INTO RATING
VALUES ('00103', '00036', '2017-9-17', 4, 2, 2, 2, 'Price was good, the service was disapointing.', '00012');
INSERT INTO RATING
VALUES ('00104', '00037', '2016-10-17', 5, 2, 5, 5, 'Food was subpar, the rest was near perfection.', '00012');
INSERT INTO RATING
VALUES ('00105', '00038', '2016-12-17', 2, 5, 4, 2, 'Amazing food, too expensive.', '00012');
