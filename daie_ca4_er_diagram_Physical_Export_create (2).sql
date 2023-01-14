-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-01-14 21:44:47.397

-- tables
-- Table: Library
CREATE TABLE Library (
    Id integer NOT NULL CONSTRAINT Library_pk PRIMARY KEY,
    project_Id integer NOT NULL,
    CONSTRAINT Library_project FOREIGN KEY (project_Id)
    REFERENCES project (Id)
);

-- Table: Team
CREATE TABLE Team (
    Team_type varchar(255) NOT NULL,
    Id integer NOT NULL CONSTRAINT Team_pk PRIMARY KEY,
    project_Id integer NOT NULL,
    CONSTRAINT Team_project FOREIGN KEY (project_Id)
    REFERENCES project (Id)
);

-- Table: Team_Member
CREATE TABLE Team_Member (
    Id integer NOT NULL CONSTRAINT Team_Member_pk PRIMARY KEY,
    Role varchar(255) NOT NULL,
    First_Name varchar(255) NOT NULL,
    Sir_Name varchar(255) NOT NULL,
    Library_Id integer NOT NULL,
    Team_Id integer NOT NULL,
    CONSTRAINT Team_Member_Library FOREIGN KEY (Library_Id)
    REFERENCES Library (Id),
    CONSTRAINT Team_Member_Team FOREIGN KEY (Team_Id)
    REFERENCES Team (Id)
);

-- Table: Team_Member_asset
CREATE TABLE Team_Member_asset (
    Team_Member_Id integer NOT NULL,
    asset_Id integer NOT NULL,
    CONSTRAINT Team_Member_asset_pk PRIMARY KEY (Team_Member_Id,asset_Id),
    CONSTRAINT Team_Member_asset_Team_Member FOREIGN KEY (Team_Member_Id)
    REFERENCES Team_Member (Id),
    CONSTRAINT Team_Member_asset_asset FOREIGN KEY (asset_Id)
    REFERENCES asset (Id)
);

-- Table: Team_work_item
CREATE TABLE Team_work_item (
    Team_Id integer NOT NULL,
    work_item_Id integer NOT NULL,
    CONSTRAINT Team_work_item_pk PRIMARY KEY (Team_Id,work_item_Id),
    CONSTRAINT Team_work_item_Team FOREIGN KEY (Team_Id)
    REFERENCES Team (Id),
    CONSTRAINT Team_work_item_work_item FOREIGN KEY (work_item_Id)
    REFERENCES work_item (Id)
);

-- Table: asset
CREATE TABLE asset (
    Id integer NOT NULL CONSTRAINT asset_pk PRIMARY KEY,
    Type varchar(255) NOT NULL,
    Format varchar(255) NOT NULL,
    Library_Id integer NOT NULL,
    CONSTRAINT asset_library FOREIGN KEY (Library_Id)
    REFERENCES Library (Id)
);

-- Table: project
CREATE TABLE project (
    Id integer NOT NULL CONSTRAINT project_pk PRIMARY KEY,
    Name varchar(255) NOT NULL,
    Delivery_date datetime NOT NULL
);

-- Table: work_item
CREATE TABLE work_item (
    Id integer NOT NULL CONSTRAINT work_item_pk PRIMARY KEY,
    Name varchar(255) NOT NULL,
    Status boolean NOT NULL,
    Team_Member_Id integer NOT NULL,
    CONSTRAINT work_item_Team_Member FOREIGN KEY (Team_Member_Id)
    REFERENCES Team_Member (Id)
);

-- End of file.

