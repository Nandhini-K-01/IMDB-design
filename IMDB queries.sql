IMDB Design a DB for IMDB 
1. Movie should have multiple media (Video or Image) 
2. Movie can belongs to multiple Genre
3. Movie can have multiple reviews and Review can belongs to a user 
4. Artist can have multiple skills 
5. Artist can perform multiple role in a single film


~Creating database
        CREATE DATABSE IMDB;


~Createing movie table
        CREATE TABLE movie(
            Movie_id INT PRIMARY KEY AUTO_INCREMENT,
            Movie_name VARCHAR(255),
            Director VARCHAR(255),
            Language VARCHAR(255)
        )
INSERT INTO movie (Movie_name, Director, Language) VALUES ("PS-1", "Manirathnam", "Tamil"), ("Vikram", "Lokesh", "Tamil");


~Creating media table
        CREATE TABLE media(
            Media_id INT PRIMARY KEY AUTO_INCREMENT,
            Media_name VARCHAR(255),
            Type VARCHAR(255),
            Movie_id INT,
            FOREIGN KEY (Movie_id) REFERENCES movie(Movie_id)
        )
INSERT INTO media (Media_name, Type, Movie_id) VALUES ("Video1", "Video", 1), ("Image1", "Image", 1), ("Video2", "Video", 2);


~Creating genre table
        CREATE TABLE genre(
            Genre_Id INT PRIMARY KEY AUTO_INCREMENT,
            Genre VARCHAR (255)
        )
INSERT INTO genre (Genre) VALUES ("Action"), ("Comedy"), ("Love"), ("Period");


~Creating movie genre table
        CREATE TABLE movie_genre(
            Id INT PRIMARY KEY AUTO_INCREMENT,
            Movie_Id INT,
            Genre_Id INT,
            FOREIGN KEY (Movie_Id) REFERENCES movie(Movie_Id),
            FOREIGN KEY (Genre_Id) REFERENCES genre(Genre_Id),
        )
INSERT INTO movie_genre (Movie_Id, Genre_Id) VALUES (1, 1), (1, 4), (2, 1);


~Creating users table 
        CREATE TABLE users(
            User_Id INT PRIMARY KEY AUTO_INCREMENT,
            Name VARCHAR(255),
            Age INT
        )
INSERT INTO users (Name, Age) VALUES ("XXX", 25), ("YYY", 45);


~Creating reviews table
        CREATE TABLE reviews(
            Id INT PRIMARY KEY AUTO_INCREMENT,
            Movie_Id INT,
            User_Id INT,
            Ratings FLOAT
            FOREIGN KEY (Movie_Id) REFERENCES movie(Movie_Id),
            FOREIGN KEY (User_Id) REFERENCES users(User_Id),
        )
INSERT INTO reviews (Movie_Id, User_Id) VALUES (1, 1, 5), (1, 2, 4), (2, 2, 4);


~Creating artists table
        CREATE TABLE artists(
            Artist_Id INT PRIMARY KEY AUTO_INCREMENT,
            Name VARCHAR(255),
            Age INT,
            Experience FLOAT
        )
INSERT INTO artists (Name, Age, Experience) VALUES ("Vikram", 55, 20), ("Kamal Hasan", 65, 35), ("VJS", 25, 40);


~Creating skills table
        CREATE TABLE skills(
            Skills_Id INT PRIMARY KEY AUTO_INCREMENT,
            Skills VARCHAR(255),
        )
INSERT INTO skills (Skills) VALUES ("Fighter"), ("Dancer"), ("Politician");


~Creating artists skills table
        CREATE TABLE artist_skills(
            Id INT PRIMARY KEY AUTO_INCREMENT,
            Artist_Id INT,
            Skills_Id INT,
            FOREIGN KEY (Artist_Id) REFERENCES movie(Movie_Id),
            FOREIGN KEY (User_Id) REFERENCES users(User_Id),
        )
INSERT INTO artist_skills (Artist_Id, Skills_Id) VALUES (1, 1), (2, 2), (2, 3), (3, 1);


~Creating roles table
        CREATE TABLE roles(
            Role_Id INT PRIMARY KEY AUTO_INCREMENT
            Role VARCHAR(255);
        )
INSERT INTO roles (Role) VALUES ("Hero", "Villian", "Friend");


~Creating Movie roles table 
        CREATE TABLE movie_roles(
            Id INT PRIMARY KEY AUTO_INCREMENT,
            Artist_Id INT,
            Movie_Id INT,
            Role_Id INT,
            FOREIGN KEY (Artist_Id) REFERENCES artists(Artist_Id);
            FOREIGN KEY (Movie_Id) REFERENCES movie(Movie_Id);
            FOREIGN KEY (Role_Id) REFERENCES roles(Role_Id);
        )
INSERT INTO movie_roles (Artist_Id, Movie_Id, Role_Id) VALUES (1,1,1), (1,2,1), (1,2,2);
