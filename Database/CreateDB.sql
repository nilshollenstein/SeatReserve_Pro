CREATE TABLE BUS (
	BUSID INT PRIMARY KEY,
	DESTINATION VARCHAR(255) NOT NULL,
	SEATCOUNT INT NOT NULL
);

CREATE TABLE USERS (
	USERID INT PRIMARY KEY,
	USERNAME VARCHAR(255),
	PASSWORD VARCHAR(255),
	ADMIN BOOL NOT NULL
);

CREATE TABLE SEAT (
	SEATID INT PRIMARY KEY,
	WIDTH INT NOT NULL,
	HEIGHT INT NOT NULL,
	RESERVED BOOL NOT NULL,
	BUSID INT NOT NULL,
	RESERVEDBYUSER INT,
	CONSTRAINT FK_BUS FOREIGN KEY (BUSID) REFERENCES BUS (BUSID),
	CONSTRAINT FK_RESERVEDBYUSER FOREIGN KEY (RESERVEDBYUSER) REFERENCES USERS (USERID)
);
SELECT * FROM users ORDER BY admin;
UPDATE users SET admin = true WHERE userid = 0;
SELECT seat.seatid, seat.reserved, seat.reservedbyuser, bus.busid, bus.destination, bus.seatcount FROM seat INNER JOIN bus ON seat.busid = bus.busid WHERE bus.busid = 1 ORDER BY reserved, seat.seatid ;
UPDATE seat SET seatid = @p1 ,width = @p2, height = @p3, reserved = @p4, busid = @p5, reservedbyuser = @p6 WHERE seatid = @p1 AND busid = @p5