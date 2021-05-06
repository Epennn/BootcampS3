CREATE DATABASE doto

USE doto


CREATE TABLE Users(
	UserID CHAR(5),
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255),
	School VARCHAR(255),
	UserAddress VARCHAR(255) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(255) NOT NULL,
	UserLocation VARCHAR(255) NOT NULL,
	DateBirth VARCHAR(255) NOT NULL,
	Gender VARCHAR(10),
	CONSTRAINT UserPK PRIMARY KEY(UserID)
)

CREATE TABLE Friends(
	FriendID CHAR(5),
	UserID CHAR(5),
	CONSTRAINT FriendPK PRIMARY KEY(FriendID),
	CONSTRAINT FriendFK FOREIGN KEY(UserID) REFERENCES Users(UserID)
		ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE Post(
	PostID CHAR(5),
	UserID CHAR(5),
	PostDate VARCHAR(255),
	PostContent VARCHAR(255),
	CONSTRAINT PostPK1 PRIMARY KEY(PostID),
	CONSTRAINT PostFK FOREIGN KEY(UserID) REFERENCES Users(UserID)
		ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE Photos(
	PhotoID CHAR(5),
	PostID CHAR(5),
	ImageContent VARCHAR(255),
	CONSTRAINT PhotoPK PRIMARY KEY(PhotoID),
	CONSTRAINT PhotoFK FOREIGN KEY(PostID) REFERENCES Post(PostID)
		ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE Comments(
	CommentID CHAR(5),
	UserID CHAR(5),
	PostID CHAR(5),
	CommentDate VARCHAR(255),
	CommentContent VARCHAR(255),
	CONSTRAINT CommentPK PRIMARY KEY(CommentID),
	CONSTRAINT CommentFK1 FOREIGN KEY(UserID) REFERENCES Users(UserID)
		ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT CommentFK2 FOREIGN KEY(PostID) REFERENCES Post(PostID)
		ON UPDATE CASCADE ON DELETE SET NULL,
)

CREATE TABLE CommentLikes(
	CommentID CHAR(5),
	UserID CHAR(5),
	CONSTRAINT LikeFK1 FOREIGN KEY(CommentID) REFERENCES Comments(CommentID),
	CONSTRAINT LikeFK2 FOREIGN KEY(UserID) REFERENCES Users(UserID),
)

CREATE TABLE Shares(
	PostID CHAR(5),
	UserID CHAR(5),
	CONSTRAINT ShareFK1 FOREIGN KEY(PostID) REFERENCES Post(PostID),
	CONSTRAINT ShareFK2 FOREIGN KEY(UserID) REFERENCES Users(UserID),
)

CREATE TABLE Pages(
	PageID CHAR(5),
	PageName VARCHAR(255),
	PageContent VARCHAR(255),
	CONSTRAINT PagePK PRIMARY KEY(PageID),
)

CREATE TABLE PageLike(
	PageID CHAR(5),
	UserID CHAR(5),
	CONSTRAINT PLikeFK1 FOREIGN KEY(PageID) REFERENCES Pages(PageID)
		ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT PLikeFK2 FOREIGN KEY(UserID) REFERENCES Users(UserID)
		ON UPDATE CASCADE ON DELETE SET NULL,
)






