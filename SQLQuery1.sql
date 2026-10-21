
 
  CREATE TABLE Owners (
      Id       INT PRIMARY KEY IDENTITY(1,1),
      Name     NVARCHAR(100) NOT NULL,
      Email    NVARCHAR(150) NOT NULL UNIQUE,
      Password NVARCHAR(256) NOT NULL
  );
 
  CREATE TABLE AppUsers (
      Id       INT PRIMARY KEY IDENTITY(1,1),
     Name     NVARCHAR(100) NOT NULL,
      Email    NVARCHAR(150) NOT NULL UNIQUE,
      Password NVARCHAR(256) NOT NULL
  );
 
  CREATE TABLE Books (
      Id          INT PRIMARY KEY IDENTITY(1,1),
      OwnerId     INT NOT NULL REFERENCES Owners(Id),
      BookName    NVARCHAR(200) NOT NULL,
      Description NVARCHAR(1000) NULL,
      IsPublished BIT NOT NULL DEFAULT 0
  );
 
  CREATE TABLE Ratings (
      Id        INT PRIMARY KEY IDENTITY(1,1),
      BookId    INT NOT NULL REFERENCES Books(Id),
      UserId    INT NOT NULL REFERENCES AppUsers(Id),
      Rating    INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
      CONSTRAINT UQ_Rating UNIQUE (BookId, UserId)
  );