-- Your code here
.headers ON 

drop table if exists attendees;

drop table if exists relationships;

drop table if exists performances;

drop table if exists parties;

drop table if exists vacations;

drop table if exists employees;

create table employees (
    id INTEGER primary key AUTOINCREMENT,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    department varchar(50) not null,
    role varchar(50) not null
);

create table relationships (
    id INTEGER primary key AUTOINCREMENT,
    employee1_id int not null,
    employee2_id int not null,
    foreign key (employee1_id) REFERENCES employees (id),
    foreign key (employee2_id) REFERENCES employees (id)
);

create table performances (
    id INTEGER primary key AUTOINCREMENT,
    employee_id int not null,
    performance_score real(3,1) not null,
    foreign key(employee_id) REFERENCES employees (id)


);

create table parties (
    id INTEGER primary key AUTOINCREMENT,
    scheduled_at TIMESTAMP not null,
    budget real(6, 2) not null,
    onsite boolean not null
);

create table attendees (
    id INTEGER primary key AUTOINCREMENT,
    party_id INTEGER not null,
    employee_id INTEGER not null,
    FOREIGN KEY (party_id) REFERENCES parties (id),
    FOREIGN KEY (employee_id) REFERENCES employees (id)
);

create table vacations (
    id INTEGER primary key AUTOINCREMENT,
    start_date TIMESTAMP not null,
    enf_date TIMESTAMP not null,
    employee_id INTEGER not null,
    FOREIGN KEY (employee_id) REFERENCES employees (id)
);

-- Add "Michael Scott" to your list of employees in the "Management" department in the role of "Regional Manager"
-- Add "Dwight Schrute" to your list of employees in the "Sales" department in the role of "Assistant Regional Manager"
-- Add "Jim Halpert" to your list of employees in the "Sales" department in the role of "Sales Representative"
-- Add "Pam Beesly" to your list of employees in the "Reception" department in the role of "Receptionist"
-- Add "Kelly Kapoor" to your list of employees in the "Product Oversight" department in the role of "Customer Service Representative"
-- Add "Angela Martin" to your list of employees in the "Accounting" department in the role of "Head of Accounting"
-- Add "Roy Anderson" to your list of employees in the "Warehouse" department in the role of "Warehouse Staff"
INSERT INTO
    EMPLOYEES (
        first_name,
        last_name,
        department,
        role
    )
VALUES (
        'Micheal',
        'Scott',
        'Management',
        'Regional Manager'
    ),
    (
        'Dwight',
        'Schrute',
        'Sales',
        'Assistant Regional Manager'
    ),
    (
        'Jim',
        'Halpert',
        'Sales',
        'Sales Representative'
    ),
    (
        'Pam',
        'Beesly',
        'Reception',
        'Receptionist'
    ),
    (
        'Kelly',
        'Kapoor',
        'Product Oversight',
        'Customer Service Representative'
    ),
    (
        'Angela',
        'Martin',
        'Accounting',
        'Head of Accounting'
    ),
    (
        'Roy',
        'Anderson',
        'Warehouse',
        'Warehouse Staff'
    );

-- "Roy Anderson" and "Pam Beesly" are in a romantic relationship.
insert into
    relationships (employee1_id, employee2_id)
values (
        (
            select id
            from employees
            where
                first_name = 'Roy'
                and last_name = 'Anderson'
        ),
        (
            select id
            from employees
            where
                first_name = 'Pam'
                and last_name = 'Beesly'
        )
    );

-- "Ryan Howard" is hired in the "Reception" department as a "Temp" role.
insert into
    employees (
        first_name,
        last_name,
        department,
        role
    )
values (
        'Ryan',
        'Howard',
        'Reception',
        'Temp'
    );

-- An onsite office party is scheduled with a budget of $100.00.
insert into
    parties (scheduled_at, budget, onsite)
values (
        '2024-08-14 05:30',
        100.00,
        true
    );

-- 11."Dwight Schrute" gets a performance review with a score of 3.3.
-- 12."Jim Halpert" gets a performance review with a score of 4.2.
insert into
    performances (
        employee_id,
        performance_score
    )
values (
        (
            select id
            from employees
            where
                first_name = 'Dwight'
                and last_name = 'Schrute'
        ),
        3.3
    ),
    (
        (
            select id
            from employees
            where
                first_name = 'Jim'
                and last_name = 'Halpert'
        ),
        4.2
    );

-- 13. "Dwight Schrute"'s past performance review needs to be changed to a score of 9.0.
-- 14. "Jim Halpert"'s past performance review needs to be changed to a score of 9.3.

update performances
set
    performance_score = 9.0
where (
        employee_id = (
            select id
            from employees
            where
                first_name = 'Dwight'
                and last_name = 'Schrute'
        )
    );

update performances
set
    performance_score = 9.3
where (
        employee_id = (
            select id
            from employees
            where
                first_name = 'Jim'
                and last_name = 'Halpert'
        )
    );

-- 15. "Jim Halpert" is promoted to the role of "Assistant Regional Manager".
UPDATE employees
set role = 'Assistant Regional Manager'
where
    first_name = 'Jim'
    AND last_name = 'Halpert';

-- 16. "Ryan Howard" is promoted to the "Sales" department as the role of "Sales Representative".
UPDATE employees
set role = 'Sales Representative'
where
    first_name = 'Ryan'
    AND last_name = 'Howard';

-- 17. An onsite office party is scheduled with a budget of $200.00.
insert into
    parties (scheduled_at, budget, onsite)
values (
        '2024-08-10 05:30',
        200.00,
        true
    );

-- 18."Angela Martin" and "Dwight Schrute" are in a romantic relationship.
insert into
    relationships (employee1_id, employee2_id)
values (
        (
            select id
            from employees
            where
                first_name = 'Angela'
                and last_name = 'Martin'
        ),
        (
            select id
            from employees
            where
                first_name = 'Dwight'
                and last_name = 'Schrute'
        )
    );

-- 19. "Angela Martin" gets a performance review score of 6.2.
insert into
    performances (
        employee_id,
        performance_score
    )
values (
        (
            select id
            from employees
            where
                first_name = 'Angela'
                and last_name = 'Martin'
        ),
        6.2
    );

-- 20. "Ryan Howard" and "Kelly Kapoor" are in a romantic relationship.
insert into
    relationships (employee1_id, employee2_id)
values (
        (
            select id
            from employees
            where
                first_name = 'Ryan'
                and last_name = 'Howard'
        ),
        (
            select id
            from employees
            where
                first_name = 'Kelly'
                and last_name = 'Kapoor'
        )
    );

-- 21. An onsite office party is scheduled with a budget of $50.00.
insert into
    parties (scheduled_at, budget, onsite)
values (
        '2024-08-26 05:30',
        50.00,
        true
    );

-- 22. "Jim Halpert" moves to another office branch (make sure to remove his relationships and performance reviews if he has any).
delete from relationships
where
    employee1_id = (
        select id
        from employees
        where
            first_name = 'Jim'
            and last_name = 'Halpert'
    )
    or employee2_id = (
        select id
        from employees
        where
            first_name = 'Jim'
            and last_name = 'Halpert'
    );

delete from performances
where
    employee_id = (
        select id
        from employees
        where
            first_name = 'Jim'
            and last_name = 'Halpert'
    );

delete from employees
where
    first_name = 'Jim'
    and last_name = 'Halpert';

-- 23. "Roy Anderson" and "Pam Beesly" are NO LONGER in a romantic relationship.
delete from relationships
where (
        employee1_id = (
            select id
            from employees
            where
                first_name = 'Roy'
                and last_name = 'Anderson'
        )
        and employee2_id = (
            select id
            from employees
            where
                first_name = 'Pam'
                and last_name = 'Beesly'
        )
    );

-- 24. "Pam Beesly" gets a performance review score of 7.6.
-- 25. "Dwight Schrute" gets another performance review score of 8.7.

insert into
    performances (
        employee_id,
        performance_score
    )
values (
        (
            select id
            from employees
            where
                first_name = 'Pam'
                and last_name = 'Beesly'
        ),
        7.6
    );

update performances
set
    performance_score = 8.7
where (
        employee_id = (
            select id
            from employees
            where
                first_name = 'Dwight'
                and last_name = 'Schrute'
        )
    );

-- 26. "Ryan Howard" quits the office (make sure to remove his relationships and performance reviews if he has any).

delete from relationships
where
    employee1_id = (
        select id
        from employees
        where
            first_name = 'Ryan'
            and last_name = 'Howard'
    )
    or employee2_id = (
        select id
        from employees
        where
            first_name = 'Ryan'
            and last_name = 'Howard'
    );

delete from performances
where
    employee_id = (
        select id
        from employees
        where
            first_name = 'Ryan'
            and last_name = 'Howard'
    );

delete from employees
where
    first_name = 'Ryan'
    and last_name = 'Howard';

-- 27."Jim Halpert" moves back to this office branch's "Sales" department in the role of "Sales Representative"
-- 28. "Karen Filippelli" moves from a different office into this office's "Sales" department in the role of "Sales Representative"
INSERT INTO
    EMPLOYEES (
        first_name,
        last_name,
        department,
        role
    )
VALUES (
        'Jim',
        'Halpert',
        'Sales',
        'Sales Representative'
    ),
    (
        'Karen',
        'Filippelli',
        'Sales',
        'Sales Representative'
    );

-- 29. "Karen Filippelli" and "Jim Halpert" are in a romantic relationship.

insert into
    relationships (employee1_id, employee2_id)
values (
        (
            select id
            from employees
            where
                first_name = 'Karen'
                and last_name = 'Filippelli'
        ),
        (
            select id
            from employees
            where
                first_name = 'Jim'
                and last_name = 'Halpert'
        )
    );

-- 30. An onsite office party is scheduled with a budget of $120.00.
insert into
    parties (scheduled_at, budget, onsite)
values (
        '2024-08-30 05:30',
        120.00,
        true
    );
-- 31. The onsite office party scheduled right before this is canceled, and an offsite office party is scheduled instead with a budget of $300.00.
delete from parties
where
    id = (
        select id
        from parties
        order by id DESC
        limit 1
    );

insert into
    parties (scheduled_at, budget, onsite)
values (
        '2024-08-30 05:30',
        300.00,
        false
    );

-- 32. "Karen Filippelli" and "Jim Halpert" are NO LONGER in a romantic relationship.
-- 33. "Pam Beesly" and "Jim Halpert" are in a romantic relationship.
delete from relationships
where
    employee1_id = (
        select id
        from employees
        where
            first_name = 'karen'
            and last_name = 'Filippelli'
    )
    or employee2_id = (
        select id
        from employees
        where
            first_name = 'Jim'
            and last_name = 'Halpert'
    );

insert into
    relationships (employee1_id, employee2_id)
values (
        (
            select id
            from employees
            where
                first_name = 'Pam'
                and last_name = 'Beesly'
        ),
        (
            select id
            from employees
            where
                first_name = 'Jim'
                and last_name = 'Halpert'
        )
    );

select * from employees;

select * from relationships;

SELECT * from parties;

select * from performances;
