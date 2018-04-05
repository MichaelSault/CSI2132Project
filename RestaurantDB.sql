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
ORDER_DATE DATE,
PRICE INT CHECK ((PRICE >= 1) AND (PRICE <= 5)),
FOOD INT CHECK ((FOOD >= 1) AND (FOOD <= 5)),
MOOD INT CHECK ((MOOD >= 1) AND (MOOD <= 5)),
STAFF INT CHECK ((STAFF >= 1) AND (STAFF <= 5)),
COMMENTS CHAR(250),
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

/*
CREATE TABLE RATINGITEM
(RATING_ID CHAR(5) REFERENCES RATING(RATING_ID),
USER_ID CHAR(5) REFERENCES RATER(USER_ID),
ORDER_DATE DATE REFERENCES RATING(ORDER_DATE),
ITEM_ID CHAR(4) REFERENCES MENUITEM(ITEM_ID),
RATING INT CHECK (RATING >= 1 AND RATING <= 5),
COMMENTS CHAR(200) );
*/

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
VALUES ('1001', 'Chicken Fight Club', 'Food', 'Main', 'Cajun dusted chicken breast, fried & topped with chedder cheese, bacon, lettuce, tomato and our signature Beechhouse sauce.', 14.53, '00001');
INSERT INTO MENUITEM
VALUES ('1002', 'Crispy Dills', 'Food', 'Starter', 'Breaded dills, deep fried to a crisp. Server with your choice of dipstick.', 9.98, '00001');
INSERT INTO MENUITEM
VALUES ('1003', 'Root 66 Shake', 'Beverage', 'Beverage', 'Are you gunna go our way with a root beer shake with root beer, creamy Canadian valilla ice cream, topped with whipped cream, oreo cookie crumble & garnished with an old-fashioned root beer candy stick.', 7.91, '00001');
INSERT INTO MENUITEM
VALUES ('1004', 'Cookie Monster', 'Food', 'Dessert', ' Chocolate chip cookies, vanilla ice cream, chocolate sauce and whipped cream.', 4.97, '00001');
INSERT INTO MENUITEM
VALUES ('1005', 'Crappy Tire', 'Food', 'Main', 'Grilled pineapple ring, sweet & spicy sauce & brie cheese(Canadian Tire $ accepted).', 13.27, '00001');

-- Moose McGuires
INSERT INTO MENUITEM
VALUES ('1006', 'Grilled Chicken Sandwich', 'Food', 'Main', 'Our marinated chicken breast with crispy bacon, mixed greens, tomatoes and pesto mayo on a fresh ciabatta bun.', 14.00, '00002');
INSERT INTO MENUITEM
VALUES ('1007', 'Potato Skina', 'Food', 'Starter', 'Russet potato skins stuffed with bacon, cheese, green onions and tomatoes. Served with salsa and sour cream.', 10.00, '00002');
INSERT INTO MENUITEM
VALUES ('1008', 'Chicken Souvlaki', 'Food', 'Main', 'Two skevers of marinated chicken breast serves with a Greek salad and warm flatbread.', 14.50, '00002');
INSERT INTO MENUITEM
VALUES ('1009', 'Canadian Pizza(15")', 'Food', 'Main', 'Bacon, mushrooms, pepperoni, smoked ham, chedder and mozzarella cheese with ranch and pizza sauce.', 25.00, '00002');
INSERT INTO MENUITEM
VALUES ('1010', 'Canadian Pizza(7")', 'Food', 'Main', 'Bacon, mushrooms, pepperoni, smoked ham, chedder and mozzarella cheese with ranch and pizza sauce.', 13.00, '00002');

-- Central Bierhaus
INSERT INTO MENUITEM
VALUES ('1011', 'Fish & Potato Cakes', 'Food', 'Starter', 'Haddock, potato, apple fennel slaw, classic tartar.', 11.00, '00003');
INSERT INTO MENUITEM
VALUES ('1012', 'Beef Short Rib', 'Food', 'Main', 'Roasted fingerling potato, wilted freens, pickled carrots.', 24.00, '00003');
INSERT INTO MENUITEM
VALUES ('1013', 'Seared Artic Char', 'Food', 'Main', 'Sweet potato, pepper, cabbage hash, mapple mustard glaze.', 20.00, '00003');
INSERT INTO MENUITEM
VALUES ('1014', 'Lobster Poutine', 'Food', 'Main', 'House chipped fries, cheese curds, lobster, bisque.', 14.00, '00003');

-- Saigon Boy Noodle House
INSERT INTO MENUITEM
VALUES ('1015', 'Shrimp Spring Roll', 'Food', 'Starter', 'description', 5.00, '00004');
INSERT INTO MENUITEM
VALUES ('1016', 'Shrimp Summer Roll', 'Food', 'Starter', 'description', 5.00, '00004');
INSERT INTO MENUITEM
VALUES ('1017', 'Don Noodle with Seafood', 'Food', 'Main', 'Shrimp, Squid, Fish Cake, Crab', 8.75, '00004');
INSERT INTO MENUITEM
VALUES ('1018', 'Coffee with Condensed Milk', 'Beverage', 'Beverage', '', 3.95, '00004');
INSERT INTO MENUITEM
VALUES ('1019', 'Red Bull', 'Beverage', 'Beverage', '', 3.50, '00004');
INSERT INTO MENUITEM
VALUES ('1020', 'Green Tea|Coconut|Ginger|Mango', 'Beverage', 'Dessert', '', 4.25, '00004');
INSERT INTO MENUITEM
VALUES ('1021', 'Vanilla Ice Cream topped with peanuts', 'Food', 'Dessert', '', 3.25, '00004');

-- The Soca Kitchen
INSERT INTO MENUITEM
VALUES ('1022', 'Soup of the Day', 'Food', 'Starter', 'Local farm fresh produce', 5.00, '00005');
INSERT INTO MENUITEM
VALUES ('1023', 'Duo tacos', 'Food', 'Main', 'Pineapple, homemade hot sauce, pickled unions', 14.00, '00005');
INSERT INTO MENUITEM
VALUES ('1024', 'Seafood tower', 'Food', 'Main', 'Oysters, lobster tail, musset escabeche, coctail shrimp', 69.00, '00005');
INSERT INTO MENUITEM
VALUES ('1025', 'Plate Grandes', 'Food', 'Main', 'charred cauliflower "steak"', 24.00, '00005');
INSERT INTO MENUITEM
VALUES ('1026', 'Plate X-Grande', 'Food', 'Main', 'X large strip loin steak, home made black garlic mashed potatoes, hazelnut, salad. For two.', 76.00, '00005');

-- MHK Sushi
INSERT INTO MENUITEM
VALUES ('1027', 'Gyoza', 'Food', 'Starter', 'Beef dumpling(5pcs)', 5.00, '00006');
INSERT INTO MENUITEM
VALUES ('1028', 'Sushi Lunch', 'Food', 'Main', '6 assorted Nigiri and 6 pieces of Maki', 13.00, '00006');
INSERT INTO MENUITEM
VALUES ('1029', 'MHK Maki Platter', 'Food', 'Main', 'Chefs special Maki, Hawaiian Maki, and Japanese bagel Maki.', 20.00, '00006');
INSERT INTO MENUITEM
VALUES ('1030', 'Dragon Roll', 'Food', 'Main', 'Eel, cucumber and mayo, avocado, smelt roe and eel sauce.', 13.00, '00006');
INSERT INTO MENUITEM
VALUES ('1031', 'Volcano Roll', 'Food', 'Main', 'California Roll with avocado slices, baked octopus and spicy house sauce on top.', 12.00, '00006');

-- Bread and Sons Bakery
INSERT INTO MENUITEM
VALUES ('1032', 'Franks Wild Years', 'Food', 'Pizza', 'Cherry, Roma, Sun dried, Roasted Garlic, Feta', 14.00, '00007');
INSERT INTO MENUITEM
VALUES ('1033', 'The Boss', 'Food', 'Pizza', 'Bocconcini, Cherry Tomatoes, Argula, Roasted Garlic', 14.00, '00007');
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
VALUES ('00001', '00031', '2016-6-23', 3, 4, 3, 5, '', '00001');
INSERT INTO RATING
VALUES ('00002', '00032', '2006-8-14', 4, 4, 2, 4, '', '00001');
INSERT INTO RATING
VALUES ('00003', '00033', '2015-10-27', 4, 4, 3, 5, '', '00001');
INSERT INTO RATING
VALUES ('00004', '00034', '2010-3-7', 4, 3, 3, 5, '', '00001');
INSERT INTO RATING
VALUES ('00005', '00035', '2005-1-16', 4, 2, 3, 4, '', '00001');
INSERT INTO RATING
VALUES ('00006', '00036', '2017-6-19', 4, 2, 5, 5, '', '00001');
INSERT INTO RATING
VALUES ('00007', '00037', '2018-3-21', 4, 4, 3, 5, '', '00001');
INSERT INTO RATING
VALUES ('00008', '00038', '2011-8-30', 3, 5, 3, 5, '', '00001');
INSERT INTO RATING
VALUES ('00009', '00039', '2009-12-1', 4, 4, 3, 5, '', '00001');
INSERT INTO RATING
VALUES ('00010', '00040', '2005-5-4', 4, 1, 3, 2, '', '00001');

-- Moose McGuires
INSERT INTO RATING
VALUES ('00011', '00041', '2016-5-17', 4, 4, 3, 5, '', '00002');
INSERT INTO RATING
VALUES ('00012', '00042', '2016-5-17', 4, 4, 3, 5, '', '00002');
INSERT INTO RATING
VALUES ('00013', '00043', '2016-5-17', 4, 4, 3, 5, '', '00002');
INSERT INTO RATING
VALUES ('00014', '00044', '2016-5-17', 4, 4, 3, 5, '', '00002');
INSERT INTO RATING
VALUES ('00015', '00045', '2016-5-17', 4, 4, 3, 5, '', '00002');
INSERT INTO RATING
VALUES ('00016', '00031', '2016-5-17', 4, 4, 3, 5, '', '00002');
INSERT INTO RATING
VALUES ('00017', '00032', '2016-5-17', 4, 4, 3, 5, '', '00002');
INSERT INTO RATING
VALUES ('00018', '00033', '2016-5-17', 4, 4, 3, 5, '', '00002');
INSERT INTO RATING
VALUES ('', '00034', '2016-5-17', 4, 4, 3, 5, '', '00002');
INSERT INTO RATING
VALUES ('00019', '00035', '2016-5-17', 4, 4, 3, 5, '', '00002');

-- Central Bierhaus
INSERT INTO RATING
VALUES ('00020', '00036', '2016-5-17', 4, 4, 3, 5, '', '00003');
INSERT INTO RATING
VALUES ('00021', '00037', '2016-5-17', 4, 4, 3, 5, '', '00003');
INSERT INTO RATING
VALUES ('00022', '00038', '2016-5-17', 4, 4, 3, 5, '', '00003');
INSERT INTO RATING
VALUES ('00023', '00039', '2016-5-17', 4, 4, 3, 5, '', '00003');
INSERT INTO RATING
VALUES ('00024', '00040', '2016-5-17', 4, 4, 3, 5, '', '00003');
INSERT INTO RATING
VALUES ('00025', '00041', '2016-5-17', 4, 4, 3, 5, '', '00003');
INSERT INTO RATING
VALUES ('00026', '00042', '2016-5-17', 4, 4, 3, 5, '', '00003');
INSERT INTO RATING
VALUES ('00027', '00043', '2016-5-17', 4, 4, 3, 5, '', '00003');
INSERT INTO RATING
VALUES ('00028', '00044', '2016-5-17', 4, 4, 3, 5, '', '00003');

-- Saigon Boy Noodle House
INSERT INTO RATING
VALUES ('00029', '00045', '2016-5-17', 4, 4, 3, 5, '', '00004');
INSERT INTO RATING
VALUES ('00030', '00044', '2016-5-17', 4, 4, 3, 5, '', '00004');
INSERT INTO RATING
VALUES ('00031', '00043', '2016-5-17', 4, 4, 3, 5, '', '00004');
INSERT INTO RATING
VALUES ('00032', '00031', '2016-5-17', 4, 4, 3, 5, '', '00004');
INSERT INTO RATING
VALUES ('00033', '00032', '2016-5-17', 4, 4, 3, 5, '', '00004');
INSERT INTO RATING
VALUES ('00034', '00033', '2016-5-17', 4, 4, 3, 5, '', '00004');
INSERT INTO RATING
VALUES ('00035', '00034', '2016-5-17', 4, 4, 3, 5, '', '00004');
INSERT INTO RATING
VALUES ('00036', '00036', '2016-5-17', 4, 4, 3, 5, '', '00004');
INSERT INTO RATING
VALUES ('00037', '00037', '2016-5-17', 4, 4, 3, 5, '', '00004');
INSERT INTO RATING
VALUES ('00038', '00039', '2016-5-17', 4, 4, 3, 5, '', '00004');

-- The Soca Kitchen
INSERT INTO RATING
VALUES ('00039', '00041', '2016-5-17', 4, 4, 3, 5, '', '00005');
INSERT INTO RATING
VALUES ('00040', '00039', '2016-5-17', 4, 4, 3, 5, '', '00005');
INSERT INTO RATING
VALUES ('00041', '00037', '2016-5-17', 4, 4, 3, 5, '', '00005');
INSERT INTO RATING
VALUES ('00042', '00036', '2016-5-17', 4, 4, 3, 5, '', '00005');
INSERT INTO RATING
VALUES ('00043', '00035', '2016-5-17', 4, 4, 3, 5, '', '00005');
INSERT INTO RATING
VALUES ('00044', '00034', '2016-5-17', 4, 4, 3, 5, '', '00005');
INSERT INTO RATING
VALUES ('00045', '00033', '2016-5-17', 4, 4, 3, 5, '', '00005');
INSERT INTO RATING
VALUES ('00046', '00032', '2016-5-17', 4, 4, 3, 5, '', '00005');
INSERT INTO RATING
VALUES ('00047', '00031', '2016-5-17', 4, 4, 3, 5, '', '00005');

-- MHK Sushi
INSERT INTO RATING
VALUES ('00048', '00031', '2016-5-17', 4, 4, 3, 5, '', '00006');
INSERT INTO RATING
VALUES ('00049', '00032', '2016-5-17', 4, 4, 3, 5, '', '00006');
INSERT INTO RATING
VALUES ('00050', '00033', '2016-5-17', 4, 4, 3, 5, '', '00006');
INSERT INTO RATING
VALUES ('00051', '00034', '2016-5-17', 4, 4, 3, 5, '', '00006');
INSERT INTO RATING
VALUES ('00052', '00035', '2016-5-17', 4, 4, 3, 5, '', '00006');
INSERT INTO RATING
VALUES ('00053', '00036', '2016-5-17', 4, 4, 3, 5, '', '00006');
INSERT INTO RATING
VALUES ('00054', '00037', '2016-5-17', 4, 4, 3, 5, '', '00006');
INSERT INTO RATING
VALUES ('00055', '00038', '2016-5-17', 4, 4, 3, 5, '', '00006');
INSERT INTO RATING
VALUES ('00056', '00039', '2016-5-17', 4, 4, 3, 5, '', '00006');
INSERT INTO RATING
VALUES ('00057', '00043', '2016-5-17', 4, 4, 3, 5, '', '00006');

-- Bread and Sons Bakery
INSERT INTO RATING
VALUES ('00058', '00031', '2016-5-17', 4, 4, 3, 5, '', '00007');
INSERT INTO RATING
VALUES ('00059', '00032', '2016-5-17', 4, 4, 3, 5, '', '00007');
INSERT INTO RATING
VALUES ('00060', '00033', '2016-5-17', 4, 4, 3, 5, '', '00007');
INSERT INTO RATING
VALUES ('00061', '00034', '2016-5-17', 4, 4, 3, 5, '', '00007');
INSERT INTO RATING
VALUES ('00062', '00035', '2016-5-17', 4, 4, 3, 5, '', '00007');
INSERT INTO RATING
VALUES ('00063', '00036', '2016-5-17', 4, 4, 3, 5, '', '00007');
INSERT INTO RATING
VALUES ('00064', '00037', '2016-5-17', 4, 4, 3, 5, '', '00007');
INSERT INTO RATING
VALUES ('00065', '00038', '2016-5-17', 4, 4, 3, 5, '', '00007');

-- The Red Dot
INSERT INTO RATING
VALUES ('00066', '00031', '2016-5-17', 4, 4, 3, 5, '', '00008');
INSERT INTO RATING
VALUES ('00067', '00032', '2016-5-17', 4, 4, 3, 5, '', '00008');
INSERT INTO RATING
VALUES ('00068', '00033', '2016-5-17', 4, 4, 3, 5, '', '00008');
INSERT INTO RATING
VALUES ('00069', '00034', '2016-5-17', 4, 4, 3, 5, '', '00008');
INSERT INTO RATING
VALUES ('00070', '00035', '2016-5-17', 4, 4, 3, 5, '', '00008');
INSERT INTO RATING
VALUES ('00071', '00036', '2016-5-17', 4, 4, 3, 5, '', '00008');
INSERT INTO RATING
VALUES ('00072', '00037', '2016-5-17', 4, 4, 3, 5, '', '00008');
INSERT INTO RATING
VALUES ('00073', '00038', '2016-5-17', 4, 4, 3, 5, '', '00008');

-- Five Guys
INSERT INTO RATING
VALUES ('00074', '00031', '2016-5-17', 4, 4, 3, 5, '', '00009');
INSERT INTO RATING
VALUES ('00075', '00032', '2016-5-17', 4, 4, 3, 5, '', '00009');
INSERT INTO RATING
VALUES ('00076', '00033', '2016-5-17', 4, 4, 3, 5, '', '00009');
INSERT INTO RATING
VALUES ('00077', '00034', '2016-5-17', 4, 4, 3, 5, '', '00009');
INSERT INTO RATING
VALUES ('00078', '00035', '2016-5-17', 4, 4, 3, 5, '', '00009');
INSERT INTO RATING
VALUES ('00079', '00036', '2016-5-17', 4, 4, 3, 5, '', '00009');
INSERT INTO RATING
VALUES ('00080', '00037', '2016-5-17', 4, 4, 3, 5, '', '00009');
INSERT INTO RATING
VALUES ('00081', '00038', '2016-5-17', 4, 4, 3, 5, '', '00009');

-- SuzyQ
INSERT INTO RATING
VALUES ('00082', '00031', '2016-5-17', 4, 4, 3, 5, '', '00010');
INSERT INTO RATING
VALUES ('00083', '00032', '2016-5-17', 4, 4, 3, 5, '', '00010');
INSERT INTO RATING
VALUES ('00084', '00033', '2016-5-17', 4, 4, 3, 5, '', '00010');
INSERT INTO RATING
VALUES ('00085', '00034', '2016-5-17', 4, 4, 3, 5, '', '00010');
INSERT INTO RATING
VALUES ('00086', '00035', '2016-5-17', 4, 4, 3, 5, '', '00010');
INSERT INTO RATING
VALUES ('00087', '00036', '2016-5-17', 4, 4, 3, 5, '', '00010');
INSERT INTO RATING
VALUES ('00088', '00037', '2016-5-17', 4, 4, 3, 5, '', '00010');
INSERT INTO RATING
VALUES ('00089', '00038', '2016-5-17', 4, 4, 3, 5, '', '00010');

-- Kallisto
INSERT INTO RATING
VALUES ('00090', '00031', '2016-5-17', 4, 4, 3, 5, '', '00011');
INSERT INTO RATING
VALUES ('00091', '00032', '2016-5-17', 4, 4, 3, 5, '', '00011');
INSERT INTO RATING
VALUES ('00092', '00033', '2016-5-17', 4, 4, 3, 5, '', '00011');
INSERT INTO RATING
VALUES ('00093', '00034', '2016-5-17', 4, 4, 3, 5, '', '00011');
INSERT INTO RATING
VALUES ('00094', '00035', '2016-5-17', 4, 4, 3, 5, '', '00011');
INSERT INTO RATING
VALUES ('00095', '00036', '2016-5-17', 4, 4, 3, 5, '', '00011');
INSERT INTO RATING
VALUES ('00096', '00037', '2016-5-17', 4, 4, 3, 5, '', '00011');
INSERT INTO RATING
VALUES ('00097', '00038', '2016-5-17', 4, 4, 3, 5, '', '00011');

-- Milestones
INSERT INTO RATING
VALUES ('00098', '00031', '2016-5-17', 4, 4, 3, 5, '', '00012');
INSERT INTO RATING
VALUES ('00099', '00032', '2016-5-17', 4, 4, 3, 5, '', '00012');
INSERT INTO RATING
VALUES ('00100', '00033', '2016-5-17', 4, 4, 3, 5, '', '00012');
INSERT INTO RATING
VALUES ('00101', '00034', '2016-5-17', 4, 4, 3, 5, '', '00012');
INSERT INTO RATING
VALUES ('00102', '00035', '2016-5-17', 4, 4, 3, 5, '', '00012');
INSERT INTO RATING
VALUES ('00103', '00036', '2016-5-17', 4, 4, 3, 5, '', '00012');
INSERT INTO RATING
VALUES ('00104', '00037', '2016-5-17', 4, 4, 3, 5, '', '00012');
INSERT INTO RATING
VALUES ('00105', '00038', '2016-5-17', 4, 4, 3, 5, '', '00012');
