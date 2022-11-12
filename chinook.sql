CREATE TABLE IF NOT EXISTS "albums"
(
    [AlbumId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "artists"
(
    [ArtistId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
CREATE TABLE IF NOT EXISTS "customers"
(
    [CustomerId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [FirstName] NVARCHAR(40)  NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [Company] NVARCHAR(80),
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60)  NOT NULL,
    [SupportRepId] INTEGER,
    FOREIGN KEY ([SupportRepId]) REFERENCES "employees" ([EmployeeId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "employees"
(
    [EmployeeId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [FirstName] NVARCHAR(20)  NOT NULL,
    [Title] NVARCHAR(30),
    [ReportsTo] INTEGER,
    [BirthDate] DATETIME,
    [HireDate] DATETIME,
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60),
    FOREIGN KEY ([ReportsTo]) REFERENCES "employees" ([EmployeeId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "genres"
(
    [GenreId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
CREATE TABLE IF NOT EXISTS "invoices"
(
    [InvoiceId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [CustomerId] INTEGER  NOT NULL,
    [InvoiceDate] DATETIME  NOT NULL,
    [BillingAddress] NVARCHAR(70),
    [BillingCity] NVARCHAR(40),
    [BillingState] NVARCHAR(40),
    [BillingCountry] NVARCHAR(40),
    [BillingPostalCode] NVARCHAR(10),
    [Total] NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY ([CustomerId]) REFERENCES "customers" ([CustomerId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "invoice_items"
(
    [InvoiceLineId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [InvoiceId] INTEGER  NOT NULL,
    [TrackId] INTEGER  NOT NULL,
    [UnitPrice] NUMERIC(10,2)  NOT NULL,
    [Quantity] INTEGER  NOT NULL,
    FOREIGN KEY ([InvoiceId]) REFERENCES "invoices" ([InvoiceId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TrackId]) REFERENCES "tracks" ([TrackId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "media_types"
(
    [MediaTypeId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
CREATE TABLE IF NOT EXISTS "playlists"
(
    [PlaylistId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
CREATE TABLE IF NOT EXISTS "playlist_track"
(
    [PlaylistId] INTEGER  NOT NULL,
    [TrackId] INTEGER  NOT NULL,
    CONSTRAINT [PK_PlaylistTrack] PRIMARY KEY  ([PlaylistId], [TrackId]),
    FOREIGN KEY ([PlaylistId]) REFERENCES "playlists" ([PlaylistId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TrackId]) REFERENCES "tracks" ([TrackId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS "tracks"
(
    [TrackId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(200)  NOT NULL,
    [AlbumId] INTEGER,
    [MediaTypeId] INTEGER  NOT NULL,
    [GenreId] INTEGER,
    [Composer] NVARCHAR(220),
    [Milliseconds] INTEGER  NOT NULL,
    [Bytes] INTEGER,
    [UnitPrice] NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY ([AlbumId]) REFERENCES "albums" ([AlbumId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([GenreId]) REFERENCES "genres" ([GenreId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([MediaTypeId]) REFERENCES "media_types" ([MediaTypeId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_AlbumArtistId] ON "albums" ([ArtistId]);
CREATE INDEX [IFK_CustomerSupportRepId] ON "customers" ([SupportRepId]);
CREATE INDEX [IFK_EmployeeReportsTo] ON "employees" ([ReportsTo]);
CREATE INDEX [IFK_InvoiceCustomerId] ON "invoices" ([CustomerId]);
CREATE INDEX [IFK_InvoiceLineInvoiceId] ON "invoice_items" ([InvoiceId]);
CREATE INDEX [IFK_InvoiceLineTrackId] ON "invoice_items" ([TrackId]);
CREATE INDEX [IFK_PlaylistTrackTrackId] ON "playlist_track" ([TrackId]);
CREATE INDEX [IFK_TrackAlbumId] ON "tracks" ([AlbumId]);
CREATE INDEX [IFK_TrackGenreId] ON "tracks" ([GenreId]);
CREATE INDEX [IFK_TrackMediaTypeId] ON "tracks" ([MediaTypeId]);
ANALYZE sqlite_schema;
INSERT INTO sqlite_stat1 VALUES('tracks','IFK_TrackMediaTypeId','3503 701');
INSERT INTO sqlite_stat1 VALUES('tracks','IFK_TrackGenreId','3503 141');
INSERT INTO sqlite_stat1 VALUES('tracks','IFK_TrackAlbumId','3503 11');
INSERT INTO sqlite_stat1 VALUES('playlist_track','IFK_PlaylistTrackTrackId','8715 3');
INSERT INTO sqlite_stat1 VALUES('playlist_track','sqlite_autoindex_playlist_track_1','8715 623 1');
INSERT INTO sqlite_stat1 VALUES('albums','IFK_AlbumArtistId','347 2');
INSERT INTO sqlite_stat1 VALUES('artists',NULL,'275');
INSERT INTO sqlite_stat1 VALUES('customers','IFK_CustomerSupportRepId','59 20');
INSERT INTO sqlite_stat1 VALUES('playlists',NULL,'18');
INSERT INTO sqlite_stat1 VALUES('employees','IFK_EmployeeReportsTo','8 2');
INSERT INTO sqlite_stat1 VALUES('genres',NULL,'25');
INSERT INTO sqlite_stat1 VALUES('invoices','IFK_InvoiceCustomerId','412 7');
INSERT INTO sqlite_stat1 VALUES('media_types',NULL,'5');
INSERT INTO sqlite_stat1 VALUES('invoice_items','IFK_InvoiceLineTrackId','2240 2');
INSERT INTO sqlite_stat1 VALUES('invoice_items','IFK_InvoiceLineInvoiceId','2240 6');
ANALYZE sqlite_schema;
