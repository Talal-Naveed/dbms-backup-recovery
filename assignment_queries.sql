## Employees Database -- ORACLE -- CREATE ALL TABLES

-- 1. EMPLOYEES TABLE

CREATE TABLE employees (
    emp_no      NUMBER(11)      NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR2(14)    NOT NULL,
    last_name   VARCHAR2(16)    NOT NULL,
    gender      VARCHAR2(1)     NOT NULL,    
    hire_date   DATE            NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no),
    CONSTRAINT chk_gender CHECK (gender IN ('M','F'))
);

-- 2. DEPARTMENTS TABLE

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR2(40)    NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no),
    CONSTRAINT uk_dept_name UNIQUE (dept_name)
);

-- 3. DEPT_MANAGER TABLE

CREATE TABLE dept_manager (
    emp_no      NUMBER(11)      NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_deptmgr_emp FOREIGN KEY (emp_no) 
        REFERENCES employees (emp_no) ON DELETE CASCADE,
    CONSTRAINT fk_deptmgr_dept FOREIGN KEY (dept_no) 
        REFERENCES departments (dept_no) ON DELETE CASCADE
);

-- 4. DEPT_EMP TABLE

CREATE TABLE dept_emp (
    emp_no      NUMBER(11)      NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_deptemp_emp FOREIGN KEY (emp_no) 
        REFERENCES employees (emp_no) ON DELETE CASCADE,
    CONSTRAINT fk_deptemp_dept FOREIGN KEY (dept_no) 
        REFERENCES departments (dept_no) ON DELETE CASCADE
);

-- 5. TITLES TABLE

CREATE TABLE titles (
    emp_no      NUMBER(11)      NOT NULL,
    title       VARCHAR2(50)    NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    CONSTRAINT pk_titles PRIMARY KEY (emp_no, title, from_date),
    CONSTRAINT fk_titles_emp FOREIGN KEY (emp_no) 
        REFERENCES employees (emp_no) ON DELETE CASCADE
);
-- INSERT ALL VALUES INTO RESPECTIVE TABLES

-- Insert departments (9 departments)

INSERT INTO departments VALUES ('d001', 'Marketing');
INSERT INTO departments VALUES ('d002', 'Finance');
INSERT INTO departments VALUES ('d003', 'Human Resources');
INSERT INTO departments VALUES ('d004', 'Production');
INSERT INTO departments VALUES ('d005', 'Development');
INSERT INTO departments VALUES ('d006', 'Quality Management');
INSERT INTO departments VALUES ('d007', 'Sales');
INSERT INTO departments VALUES ('d008', 'Research');
INSERT INTO departments VALUES ('d009', 'Customer Service');

-- Insert employees (10 sample employees)

INSERT INTO employees VALUES (10001, TO_DATE('1953-09-02','YYYY-MM-DD'), 'Georgi', 'Facello', 'M', TO_DATE('1986-06-26','YYYY-MM-DD'));
INSERT INTO employees VALUES (10002, TO_DATE('1964-06-02','YYYY-MM-DD'), 'Bezalel', 'Simmel', 'F', TO_DATE('1985-11-21','YYYY-MM-DD'));
INSERT INTO employees VALUES (10003, TO_DATE('1959-12-03','YYYY-MM-DD'), 'Parto', 'Bamford', 'M', TO_DATE('1986-08-28','YYYY-MM-DD'));
INSERT INTO employees VALUES (10004, TO_DATE('1954-05-01','YYYY-MM-DD'), 'Chirstian', 'Koblick', 'M', TO_DATE('1986-12-01','YYYY-MM-DD'));
INSERT INTO employees VALUES (10005, TO_DATE('1955-01-21','YYYY-MM-DD'), 'Kyoichi', 'Maliniak', 'M', TO_DATE('1989-09-12','YYYY-MM-DD'));
INSERT INTO employees VALUES (10006, TO_DATE('1953-04-20','YYYY-MM-DD'), 'Anneke', 'Preusig', 'F', TO_DATE('1989-06-02','YYYY-MM-DD'));
INSERT INTO employees VALUES (10007, TO_DATE('1957-05-23','YYYY-MM-DD'), 'Tzvetan', 'Zielinski', 'F', TO_DATE('1989-02-10','YYYY-MM-DD'));
INSERT INTO employees VALUES (10008, TO_DATE('1958-02-19','YYYY-MM-DD'), 'Saniya', 'Kalloufi', 'M', TO_DATE('1994-09-15','YYYY-MM-DD'));
INSERT INTO employees VALUES (10009, TO_DATE('1952-04-19','YYYY-MM-DD'), 'Sumant', 'Peac', 'F', TO_DATE('1985-02-18','YYYY-MM-DD'));
INSERT INTO employees VALUES (10010, TO_DATE('1963-06-01','YYYY-MM-DD'), 'Duangkaew', 'Piveteau', 'F', TO_DATE('1989-08-24','YYYY-MM-DD'));

-- Insert dept_emp 

INSERT INTO dept_emp VALUES (10001, 'd005', TO_DATE('1986-06-26','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO dept_emp VALUES (10002, 'd007', TO_DATE('1996-08-03','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO dept_emp VALUES (10003, 'd004', TO_DATE('1995-12-03','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO dept_emp VALUES (10004, 'd004', TO_DATE('1986-12-01','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO dept_emp VALUES (10005, 'd003', TO_DATE('1989-09-12','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO dept_emp VALUES (10006, 'd005', TO_DATE('1990-08-05','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO dept_emp VALUES (10007, 'd008', TO_DATE('1989-02-10','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO dept_emp VALUES (10008, 'd005', TO_DATE('1998-03-11','YYYY-MM-DD'), TO_DATE('2000-07-31','YYYY-MM-DD'));
INSERT INTO dept_emp VALUES (10009, 'd006', TO_DATE('1985-02-18','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO dept_emp VALUES (10010, 'd006', TO_DATE('1996-11-24','YYYY-MM-DD'), TO_DATE('2000-06-26','YYYY-MM-DD'));

-- Insert dept_manager 

INSERT INTO dept_manager VALUES (10001, 'd005', TO_DATE('1986-06-26','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO dept_manager VALUES (10002, 'd007', TO_DATE('1996-08-03','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));

-- Insert titles

INSERT INTO titles VALUES (10001, 'Senior Engineer', TO_DATE('1986-06-26','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO titles VALUES (10002, 'Staff', TO_DATE('1996-08-03','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO titles VALUES (10003, 'Senior Engineer', TO_DATE('1995-12-03','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO titles VALUES (10004, 'Engineer', TO_DATE('1986-12-01','YYYY-MM-DD'), TO_DATE('1995-12-01','YYYY-MM-DD'));
INSERT INTO titles VALUES (10004, 'Senior Engineer', TO_DATE('1995-12-01','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO titles VALUES (10005, 'Senior Staff', TO_DATE('1996-09-12','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO titles VALUES (10006, 'Senior Engineer', TO_DATE('1990-08-05','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO titles VALUES (10007, 'Senior Staff', TO_DATE('1996-02-11','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO titles VALUES (10008, 'Assistant Engineer', TO_DATE('1998-03-11','YYYY-MM-DD'), TO_DATE('2000-07-31','YYYY-MM-DD'));
INSERT INTO titles VALUES (10009, 'Assistant Engineer', TO_DATE('1985-02-18','YYYY-MM-DD'), TO_DATE('1990-02-18','YYYY-MM-DD'));
INSERT INTO titles VALUES (10009, 'Engineer', TO_DATE('1990-02-18','YYYY-MM-DD'), TO_DATE('1995-02-18','YYYY-MM-DD'));
INSERT INTO titles VALUES (10009, 'Senior Engineer', TO_DATE('1995-02-18','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));
INSERT INTO titles VALUES (10010, 'Engineer', TO_DATE('1996-11-24','YYYY-MM-DD'), TO_DATE('9999-01-01','YYYY-MM-DD'));

COMMIT;

-- Oracle Database Backup
C:\Users\Name>expdp SYSTEM/name DIRECTORY=dpump_dir DUMPFILE=employees_backup.dmp LOGFILE=employees_backup.dmp.LOG TABLES=employees

-- Oracle Database Restoration
C:\Users\Name>impdp SYSTEM/pwd DIRECTORY=dpump_dir DUMPFILE=employees_backup.dmp LOGFILE=employees_restore.LOG TABLES=employees

  
## PostgreSQL -- CREATE ALL TABLES

-- EMPLOYEES TABLE
CREATE TABLE employees (
    emp_no      INTEGER         NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      VARCHAR(1)      NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no),
    CHECK (gender IN ('M','F'))
);

-- DEPARTMENTS TABLE
CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE (dept_name)
);

-- DEPT_MANAGER TABLE
CREATE TABLE dept_manager (
    emp_no      INTEGER         NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE
);

-- DEPT_EMP TABLE
CREATE TABLE dept_emp (
    emp_no      INTEGER         NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE
);

-- TITLES TABLE
CREATE TABLE titles (
    emp_no      INTEGER         NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    PRIMARY KEY (emp_no, title, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE
);
-- INSERT ALL VALUES INTO RESPECTIVE TABLES

-- Insert departments (9 departments)

INSERT INTO departments VALUES ('d001', 'Marketing');
INSERT INTO departments VALUES ('d002', 'Finance');
INSERT INTO departments VALUES ('d003', 'Human Resources');
INSERT INTO departments VALUES ('d004', 'Production');
INSERT INTO departments VALUES ('d005', 'Development');
INSERT INTO departments VALUES ('d006', 'Quality Management');
INSERT INTO departments VALUES ('d007', 'Sales');
INSERT INTO departments VALUES ('d008', 'Research');
INSERT INTO departments VALUES ('d009', 'Customer Service');

-- Insert employees (10 sample employees)

INSERT INTO employees VALUES (10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');
INSERT INTO employees VALUES (10002, '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21');
INSERT INTO employees VALUES (10003, '1959-12-03', 'Parto', 'Bamford', 'M', '1986-08-28');
INSERT INTO employees VALUES (10004, '1954-05-01', 'Chirstian', 'Koblick', 'M', '1986-12-01');
INSERT INTO employees VALUES (10005, '1955-01-21', 'Kyoichi', 'Maliniak', 'M', '1989-09-12');
INSERT INTO employees VALUES (10006, '1953-04-20', 'Anneke', 'Preusig', 'F', '1989-06-02');
INSERT INTO employees VALUES (10007, '1957-05-23', 'Tzvetan', 'Zielinski', 'F', '1989-02-10');
INSERT INTO employees VALUES (10008, '1958-02-19', 'Saniya', 'Kalloufi', 'M', '1994-09-15');
INSERT INTO employees VALUES (10009, '1952-04-19', 'Sumant', 'Peac', 'F', '1985-02-18');
INSERT INTO employees VALUES (10010, '1963-06-01', 'Duangkaew', 'Piveteau', 'F', '1989-08-24');

-- Insert dept_emp relationships (10 records)

INSERT INTO dept_emp VALUES (10001, 'd005', '1986-06-26', '9999-01-01');
INSERT INTO dept_emp VALUES (10002, 'd007', '1996-08-03', '9999-01-01');
INSERT INTO dept_emp VALUES (10003, 'd004', '1995-12-03', '9999-01-01');
INSERT INTO dept_emp VALUES (10004, 'd004', '1986-12-01', '9999-01-01');
INSERT INTO dept_emp VALUES (10005, 'd003', '1989-09-12', '9999-01-01');
INSERT INTO dept_emp VALUES (10006, 'd005', '1990-08-05', '9999-01-01');
INSERT INTO dept_emp VALUES (10007, 'd008', '1989-02-10', '9999-01-01');
INSERT INTO dept_emp VALUES (10008, 'd005', '1998-03-11', '2000-07-31');
INSERT INTO dept_emp VALUES (10009, 'd006', '1985-02-18', '9999-01-01');
INSERT INTO dept_emp VALUES (10010, 'd006', '1996-11-24', '2000-06-26');

-- Insert dept_manager relationships (2 records)

INSERT INTO dept_manager VALUES (10001, 'd005', '1986-06-26', '9999-01-01');
INSERT INTO dept_manager VALUES (10002, 'd007', '1996-08-03', '9999-01-01');

-- Insert titles (13 records)

INSERT INTO titles VALUES (10001, 'Senior Engineer', '1986-06-26', '9999-01-01');
INSERT INTO titles VALUES (10002, 'Staff', '1996-08-03', '9999-01-01');
INSERT INTO titles VALUES (10003, 'Senior Engineer', '1995-12-03', '9999-01-01');
INSERT INTO titles VALUES (10004, 'Engineer', '1986-12-01', '1995-12-01');
INSERT INTO titles VALUES (10004, 'Senior Engineer', '1995-12-01', '9999-01-01');
INSERT INTO titles VALUES (10005, 'Senior Staff', '1996-09-12', '9999-01-01');
INSERT INTO titles VALUES (10006, 'Senior Engineer', '1990-08-05', '9999-01-01');
INSERT INTO titles VALUES (10007, 'Senior Staff', '1996-02-11', '9999-01-01');
INSERT INTO titles VALUES (10008, 'Assistant Engineer', '1998-03-11', '2000-07-31');
INSERT INTO titles VALUES (10009, 'Assistant Engineer', '1985-02-18', '1990-02-18');
INSERT INTO titles VALUES (10009, 'Engineer', '1990-02-18', '1995-02-18');
INSERT INTO titles VALUES (10009, 'Senior Engineer', '1995-02-18', '9999-01-01');
INSERT INTO titles VALUES (10010, 'Engineer', '1996-11-24', '9999-01-01');

-- Insert sample salaries (10 records)

INSERT INTO salaries VALUES (10001, 60117, '1986-06-26', '1987-06-26');
INSERT INTO salaries VALUES (10001, 62102, '1987-06-26', '9999-01-01');
INSERT INTO salaries VALUES (10002, 65828, '1996-08-03', '9999-01-01');
INSERT INTO salaries VALUES (10003, 40006, '1995-12-03', '9999-01-01');
INSERT INTO salaries VALUES (10004, 40054, '1986-12-01', '1995-12-01');
INSERT INTO salaries VALUES (10004, 43624, '1995-12-01', '9999-01-01');
INSERT INTO salaries VALUES (10005, 78228, '1989-09-12', '9999-01-01');
INSERT INTO salaries VALUES (10006, 40000, '1990-08-05', '9999-01-01');
INSERT INTO salaries VALUES (10007, 56724, '1989-02-10', '9999-01-01');
INSERT INTO salaries VALUES (10008, 46671, '1998-03-11', '2000-07-31');

-- BACKUP COMMAND
pg_dump -U postgres -d employees_db -F c -f C:\backup\employees_backup.dump

-- RESTORE COMMAND
pg_restore -U postgres -d employees_db -v C:\backup\employees_backup.dump

  
## MONGODB -- EMPLOYEE TABLE

[{
  "_id": {
    "$oid": "6954e7776484cd661566d4bf"
  },
  "emp_no": 10001,
  "birth_date": "1953-09-02",
  "first_name": "Georgi",
  "last_name": "Facello",
  "gender": "M",
  "hire_date": "1986-06-26",
  "titles": [
    {
      "title": "Senior Engineer",
      "from_date": "1986-06-26",
      "to_date": "9999-01-01"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d005",
      "role": "Employee",
      "from_date": "1986-06-26",
      "to_date": "9999-01-01"
    },
    {
      "dept_no": "d005",
      "role": "Manager",
      "from_date": "1986-06-26",
      "to_date": "9999-01-01"
    }
  ]
},
{
  "_id": {
    "$oid": "6954e7776484cd661566d4c0"
  },
  "emp_no": 10002,
  "birth_date": "1964-06-02",
  "first_name": "Bezalel",
  "last_name": "Simmel",
  "gender": "F",
  "hire_date": "1985-11-21",
  "titles": [
    {
      "title": "Staff",
      "from_date": "1996-08-03",
      "to_date": "9999-01-01"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d007",
      "role": "Employee",
      "from_date": "1996-08-03",
      "to_date": "9999-01-01"
    },
    {
      "dept_no": "d007",
      "role": "Manager",
      "from_date": "1996-08-03",
      "to_date": "9999-01-01"
    }
  ]
},
{
  "_id": {
    "$oid": "6954e7776484cd661566d4c1"
  },
  "emp_no": 10003,
  "birth_date": "1959-12-03",
  "first_name": "Parto",
  "last_name": "Bamford",
  "gender": "M",
  "hire_date": "1986-08-28",
  "titles": [
    {
      "title": "Senior Engineer",
      "from_date": "1995-12-03",
      "to_date": "9999-01-01"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d004",
      "role": "Employee",
      "from_date": "1995-12-03",
      "to_date": "9999-01-01"
    }
  ]
},
{
  "_id": {
    "$oid": "6954e7776484cd661566d4c2"
  },
  "emp_no": 10004,
  "birth_date": "1954-05-01",
  "first_name": "Chirstian",
  "last_name": "Koblick",
  "gender": "M",
  "hire_date": "1986-12-01",
  "titles": [
    {
      "title": "Engineer",
      "from_date": "1986-12-01",
      "to_date": "1995-12-01"
    },
    {
      "title": "Senior Engineer",
      "from_date": "1995-12-01",
      "to_date": "9999-01-01"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d004",
      "role": "Employee",
      "from_date": "1986-12-01",
      "to_date": "9999-01-01"
    }
  ]
},
{
  "_id": {
    "$oid": "6954e7776484cd661566d4c3"
  },
  "emp_no": 10005,
  "birth_date": "1955-01-21",
  "first_name": "Kyoichi",
  "last_name": "Maliniak",
  "gender": "M",
  "hire_date": "1989-09-12",
  "titles": [
    {
      "title": "Senior Staff",
      "from_date": "1996-09-12",
      "to_date": "9999-01-01"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d003",
      "role": "Employee",
      "from_date": "1989-09-12",
      "to_date": "9999-01-01"
    }
  ]
},
{
  "_id": {
    "$oid": "6954e7776484cd661566d4c4"
  },
  "emp_no": 10006,
  "birth_date": "1953-04-20",
  "first_name": "Anneke",
  "last_name": "Preusig",
  "gender": "F",
  "hire_date": "1989-06-02",
  "titles": [
    {
      "title": "Senior Engineer",
      "from_date": "1990-08-05",
      "to_date": "9999-01-01"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d005",
      "role": "Employee",
      "from_date": "1990-08-05",
      "to_date": "9999-01-01"
    }
  ]
},
{
  "_id": {
    "$oid": "6954e7776484cd661566d4c5"
  },
  "emp_no": 10007,
  "birth_date": "1957-05-23",
  "first_name": "Tzvetan",
  "last_name": "Zielinski",
  "gender": "F",
  "hire_date": "1989-02-10",
  "titles": [
    {
      "title": "Senior Staff",
      "from_date": "1996-02-11",
      "to_date": "9999-01-01"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d008",
      "role": "Employee",
      "from_date": "1989-02-10",
      "to_date": "9999-01-01"
    }
  ]
},
{
  "_id": {
    "$oid": "6954e7776484cd661566d4c6"
  },
  "emp_no": 10008,
  "birth_date": "1958-02-19",
  "first_name": "Saniya",
  "last_name": "Kalloufi",
  "gender": "M",
  "hire_date": "1994-09-15",
  "titles": [
    {
      "title": "Assistant Engineer",
      "from_date": "1998-03-11",
      "to_date": "2000-07-31"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d005",
      "role": "Employee",
      "from_date": "1998-03-11",
      "to_date": "2000-07-31"
    }
  ]
},
{
  "_id": {
    "$oid": "6954e7776484cd661566d4c7"
  },
  "emp_no": 10009,
  "birth_date": "1952-04-19",
  "first_name": "Sumant",
  "last_name": "Peac",
  "gender": "F",
  "hire_date": "1985-02-18",
  "titles": [
    {
      "title": "Assistant Engineer",
      "from_date": "1985-02-18",
      "to_date": "1990-02-18"
    },
    {
      "title": "Engineer",
      "from_date": "1990-02-18",
      "to_date": "1995-02-18"
    },
    {
      "title": "Senior Engineer",
      "from_date": "1995-02-18",
      "to_date": "9999-01-01"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d006",
      "role": "Employee",
      "from_date": "1985-02-18",
      "to_date": "9999-01-01"
    }
  ]
},
{
  "_id": {
    "$oid": "6954e7776484cd661566d4c8"
  },
  "emp_no": 10010,
  "birth_date": "1963-06-01",
  "first_name": "Duangkaew",
  "last_name": "Piveteau",
  "gender": "F",
  "hire_date": "1989-08-24",
  "titles": [
    {
      "title": "Engineer",
      "from_date": "1996-11-24",
      "to_date": "9999-01-01"
    }
  ],
  "department_roles": [
    {
      "dept_no": "d006",
      "role": "Employee",
      "from_date": "1996-11-24",
      "to_date": "2000-06-26"
    }
  ]
}]

  -- DEPARTMENT TABLE

[{
  "_id": {
    "$oid": "6954e74e6484cd661566d4b1"
  },
  "dept_no": "d001",
  "dept_name": "Marketing"
},
{
  "_id": {
    "$oid": "6954e74e6484cd661566d4b2"
  },
  "dept_no": "d002",
  "dept_name": "Finance"
},
{
  "_id": {
    "$oid": "6954e74e6484cd661566d4b3"
  },
  "dept_no": "d003",
  "dept_name": "Human Resources"
},
{
  "_id": {
    "$oid": "6954e74e6484cd661566d4b4"
  },
  "dept_no": "d004",
  "dept_name": "Production"
},
{
  "_id": {
    "$oid": "6954e74e6484cd661566d4b5"
  },
  "dept_no": "d005",
  "dept_name": "Development"
},
{
  "_id": {
    "$oid": "6954e74e6484cd661566d4b6"
  },
  "dept_no": "d006",
  "dept_name": "Quality Management"
},
{
  "_id": {
    "$oid": "6954e74e6484cd661566d4b7"
  },
  "dept_no": "d007",
  "dept_name": "Sales"
},
{
  "_id": {
    "$oid": "6954e74e6484cd661566d4b8"
  },
  "dept_no": "d008",
  "dept_name": "Research"
},
{
  "_id": {
    "$oid": "6954e74e6484cd661566d4b9"
  },
  "dept_no": "d009",
  "dept_name": "Customer Service"
}]

  
## MICROSOFT SQL SERVER -- CREATE ALL TABLES

CREATE TABLE departments (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE (dept_name)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(14) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    gender CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    CHECK (gender IN ('M','F'))
);

CREATE TABLE dept_manager (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL,
    PRIMARY KEY (emp_no, title, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
-- INSERT ALL VALUES INTO RESPECTIVE TABLES

-- Insert into departments
INSERT INTO departments (dept_no, dept_name) VALUES
('d001', 'Marketing'),
('d002', 'Finance'),
('d003', 'Human Resources'),
('d004', 'Production'),
('d005', 'Development'),
('d006', 'Quality Management'),
('d007', 'Sales'),
('d008', 'Research'),
('d009', 'Customer Service');

-- Insert into employees
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES
(10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26'),
(10002, '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21'),
(10003, '1959-12-03', 'Parto', 'Bamford', 'M', '1986-08-28'),
(10004, '1954-05-01', 'Chirstian', 'Koblick', 'M', '1986-12-01'),
(10005, '1955-01-21', 'Kyoichi', 'Maliniak', 'M', '1989-09-12'),
(10006, '1953-04-20', 'Anneke', 'Preusig', 'F', '1989-06-02'),
(10007, '1957-05-23', 'Tzvetan', 'Zielinski', 'F', '1989-02-10'),
(10008, '1958-02-19', 'Saniya', 'Kalloufi', 'M', '1994-09-15'),
(10009, '1952-04-19', 'Sumant', 'Peac', 'F', '1985-02-18'),
(10010, '1963-06-01', 'Duangkaew', 'Piveteau', 'F', '1989-08-24');

-- Insert into dept_emp
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date) VALUES
(10001, 'd005', '1986-06-26', '9999-01-01'),
(10002, 'd007', '1996-08-03', '9999-01-01'),
(10003, 'd004', '1995-12-03', '9999-01-01'),
(10004, 'd004', '1986-12-01', '9999-01-01'),
(10005, 'd003', '1989-09-12', '9999-01-01'),
(10006, 'd005', '1990-08-05', '9999-01-01'),
(10007, 'd008', '1989-02-10', '9999-01-01'),
(10008, 'd005', '1998-03-11', '2000-07-31'),
(10009, 'd006', '1985-02-18', '9999-01-01'),
(10010, 'd006', '1996-11-24', '2000-06-26');

-- Insert into dept_manager
INSERT INTO dept_manager (emp_no, dept_no, from_date, to_date) VALUES
(10001, 'd005', '1986-06-26', '9999-01-01'),
(10002, 'd007', '1996-08-03', '9999-01-01');

-- Insert into titles
INSERT INTO titles (emp_no, title, from_date, to_date) VALUES
(10001, 'Senior Engineer', '1986-06-26', '9999-01-01'),
(10002, 'Staff', '1996-08-03', '9999-01-01'),
(10003, 'Senior Engineer', '1995-12-03', '9999-01-01'),
(10004, 'Engineer', '1986-12-01', '1995-12-01'),
(10004, 'Senior Engineer', '1995-12-01', '9999-01-01'),
(10005, 'Senior Staff', '1996-09-12', '9999-01-01'),
(10006, 'Senior Engineer', '1990-08-05', '9999-01-01'),
(10007, 'Senior Staff', '1996-02-11', '9999-01-01'),
(10008, 'Assistant Engineer', '1998-03-11', '2000-07-31'),
(10009, 'Assistant Engineer', '1985-02-18', '1990-02-18'),
(10009, 'Engineer', '1990-02-18', '1995-02-18'),
(10009, 'Senior Engineer', '1995-02-18', '9999-01-01'),
(10010, 'Engineer', '1996-11-24', '9999-01-01');

-- ACCESS MASTER DATABASE
USE master;
GO

-- BACKUP DATABASE
BACKUP DATABASE employees_db
TO DISK = 'C:\backup\employees_backup.bak'
WITH FORMAT, 
   MEDIANAME = 'employees_full_backup', 
   NAME = 'Full Backup of employees_db';

-- RESTORE DATABASE
RESTORE DATABASE employees_db
FROM DISK = 'C:\backup\employees_backup.bak'
WITH REPLACE;

-- SHOW ALL TABLE STRUCTURE
EXEC sp_help employees;
EXEC sp_help departments;
EXEC sp_help dept_emp;
EXEC sp_help dept_manager;
EXEC sp_help titles;
