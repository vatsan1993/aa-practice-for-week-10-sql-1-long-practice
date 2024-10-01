-- Your code here
.headers ON
-- 1 adding rachel
INSERT into customers (name, phone) VALUES ('Rachel', '1111111111');

-- 2 Rachel purchases a coffee
update customers set points = points + 1 where name = 'Rachel';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Rachel'
        )
    );

-- 3. adding 2 new members
insert into
    customers (name, email, phone)
values (
        'Monica',
        'monica@friends.show',
        2222222222
    ),
    (
        'Phoebe',
        'phoebe@friends.show',
        3333333333
    );

-- 4. Phoebe purchases three coffees.

update customers set points = points + 3 where name = 'Phoebe';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Phoebe'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Phoebe'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Phoebe'
        )
    );

-- 5.Rachel and Monica each purchase four coffees.
update customers set points = points + 4 where name = 'Rachel';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Rachel'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Rachel'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Rachel'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Rachel'
        )
    );

update customers set points = points + 4 where name = 'Monica';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Monica'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Monica'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Monica'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Monica'
        )
    );

-- 6. Monica wants to know her new point total.
select points from customers where name = 'Monica';

-- 7. Rachel wants to check her total points. Redeem her points for a coffee if she has enough points. If she doesn't, she wants to purchase a coffee.

SELECT points from customers where name = 'Rachel';

-- redeeming points
update customers set points = 0 where name = 'Rachel';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        true,
        (
            select id
            from customers
            where
                name = 'Rachel'
        )
    );

-- 8. Three new customers joined the loyalty program with the following customer information:
insert into
    customers (name, email)
values ('Joey', 'joey@friends.show'),
    (
        'Chandler',
        'chandler@friends.show'
    ),
    ('Ross', 'ross@friends.show');

-- 9. Ross purchases six coffees.

update customers set points = points + 6 where name = 'Ross';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Ross'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Ross'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Ross'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Ross'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Ross'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Ross'
        )
    );

--10. Monica purchases three coffees.

update customers set points = points + 3 where name = 'Monica';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Monica'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Monica'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Monica'
        )
    );

-- 11. Phoebe wants to check her total points. Redeem her points for a coffee if she has enough points. If she doesn't, she wants to purchase a coffee.

select points from customers where name = 'Phoebe';

-- purchasing a coffee
update customers set points = points + 1 where name = 'Phoebe';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Phoebe'
        )
    );

--Ross demands a refund for the last two coffees that he ordered. (Make sure you delete Ross's coffee orders and not anyone else's. Update his points to reflect the returned purchases.)

delete from coffee_orders
where
    customer_id in(
        select coffee_orders.id
        from coffee_orders join customers
        on customers.id = coffee_orders.customer_id
        where
            name = 'Ross'
        order by ordered_at DESC
        limit 2


) ;

UPDATE customers set points = points - 2 where name = 'Ross';

-- Joey purchases two coffees.
update customers set points = points + 2 where name = 'Joey';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Joey'
        )
    ),
    (
        false,
        (
            select id
            from customers
            where
                name = 'Joey'
        )
    );

-- 14. Monica wants to check her total points. Redeem her points for a coffee if she has enough points. If she doesn't, she wants to purchase a coffee.
select points as Monica_Points from customers where name = 'Monica';

update customers set points = points - 10 where name = 'Monica';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        true,
        (
            select id
            from customers
            where
                name = 'Monica'
        )
    );

--15. Chandler wants to delete his loyalty program account.
delete from customers where name = 'Chandler';

-- Ross wants to check his total points. Redeem his points for a coffee if he has enough points. If he doesn't, he wants to purchase a coffee.
select points from customers where name = 'Ross';

update customers set points = points + 1 where name = 'Ross';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Ross'
        )
    );

--17. Joey wants to check his total points. Redeem his points for a coffee if he has enough points. If he doesn't, he wants to purchase a coffee.
select points from customers where name = 'Joey';

update customers set points = points + 1 where name = 'Joey';

insert into
    coffee_orders (is_redeemed, customer_id)
values (
        false,
        (
            select id
            from customers
            where
                name = 'Joey'
        )
    );

update customers
set
    email = 'p_as_in_phoebe@friends.show'
where
    name = 'Phoebe';

SELECT * from customers;

SELECT * from coffee_orders;
