-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Modified heavily because it wasn't making sense and I couldn't figure out the problem.

CREATE TABLE "departments" (
    "dept_no" varchar(4) NOT NULL PRIMARY KEY,
    "dept_name" varchar(20) NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar(5) NOT NULL PRIMARY KEY,
    "title" varchar(20) NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int NOT NULL PRIMARY KEY,
    "emp_title" varchar(5) NOT NULL REFERENCES "titles" ("title_id"),
    "birth_date" date NOT NULL,
    "first_name" varchar(20) NOT NULL,
    "last_name" varchar(20) NOT NULL,
    "sex" varchar(1) NOT NULL,
    "hire_date" date NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL REFERENCES "employees" ("emp_no"),
    "dept_no" varchar(4) NOT NULL REFERENCES "departments" ("dept_no"),
	CONSTRAINT de_comp_key PRIMARY KEY ("emp_no","dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(4) NOT NULL REFERENCES "departments" ("dept_no"),
    "emp_no" int NOT NULL PRIMARY KEY REFERENCES "employees" ("emp_no")
);

CREATE TABLE "salaries" (
    "emp_no" int NOT NULL PRIMARY KEY REFERENCES "employees" ("emp_no"),
    "salary" int NOT NULL
);


-- stuff from QuickDBD that I implemented in table creation instead

-- ALTER TABLE "dept_emp" ADD CONSTRAINT FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "dept_emp" ADD CONSTRAINT FOREIGN KEY("dept_no")
-- REFERENCES "departments" ("dept_no");

-- ALTER TABLE "dept_manager" ADD CONSTRAINT FOREIGN KEY("dept_no")
-- REFERENCES "departments" ("dept_no");

-- ALTER TABLE "dept_manager" ADD CONSTRAINT FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "salaries" ADD CONSTRAINT FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "titles" ADD CONSTRAINT FOREIGN KEY("title_id")
-- REFERENCES "employees" ("emp_title");

