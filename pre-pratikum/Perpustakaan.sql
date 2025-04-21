-- NAMA : YOGI SAPUTRA
-- NIM : 23241007
-- KELAS : A 
-- DATABASE: Perpustakaan

CREATE DATABASE IF NOT EXISTS Perpustakaan;
USE Perpustakaan;

-- Tabel Kategori
CREATE TABLE IF NOT EXISTS Kategori (
    Kategori_Buku VARCHAR(100) PRIMARY KEY
);
INSERT INTO Kategori VALUES
('Fiksi'), ('Sejarah'), ('Teknologi'), ('Anak-anak'), ('Non-Fiksi');

-- Tabel Jenis_Buku
CREATE TABLE IF NOT EXISTS Jenis_Buku (
    Nama_jenis VARCHAR(100) PRIMARY KEY
);
INSERT INTO Jenis_Buku VALUES
('Novel'), ('Ensiklopedia'), ('Panduan'), ('Cerita'), ('Referensi');

-- Tabel Buku
CREATE TABLE IF NOT EXISTS Buku (
    ID_Buku INT PRIMARY KEY,
    Nama VARCHAR(255),
    Kategori VARCHAR(100),
    Jenis_buku VARCHAR(100),
    FOREIGN KEY (Kategori) REFERENCES Kategori(Kategori_Buku),
    FOREIGN KEY (Jenis_buku) REFERENCES Jenis_Buku(Nama_jenis)
);
INSERT INTO Buku VALUES
(1, 'Laskar Pelangi', 'Fiksi', 'Novel'),
(2, 'Sejarah Dunia', 'Sejarah', 'Ensiklopedia'),
(3, 'Belajar MySQL', 'Teknologi', 'Panduan'),
(4, 'Dongeng Nusantara', 'Anak-anak', 'Cerita'),
(5, 'Psikologi Populer', 'Non-Fiksi', 'Referensi');

-- Tabel Penulis
CREATE TABLE IF NOT EXISTS Penulis (
    ID_Penulis INT PRIMARY KEY,
    FNama VARCHAR(100),
    MNama VARCHAR(100),
    LNama VARCHAR(100),
    Biografi TEXT,
    Karya_Terdahulu TEXT,
    Kontak VARCHAR(100),
    Riwayat_Pendidikan TEXT,
    ID_Buku INT,
    FOREIGN KEY (ID_Buku) REFERENCES Buku(ID_Buku)
);
INSERT INTO Penulis VALUES
(1, 'Andrea', '', 'Hirata', 'Penulis asal Indonesia.', 'Laskar Pelangi', 'andrea@contoh.com', 'Universitas Indonesia', 1),
(2, 'John', '', 'Doe', 'Sejarawan.', 'Perang Dunia', 'john@history.com', 'Harvard University', 2),
(3, 'Lisa', '', 'Tan', 'Ahli Teknologi.', 'Pemrograman Dasar', 'lisa@tech.com', 'MIT', 3),
(4, 'Rina', '', 'Putri', 'Penulis cerita anak.', 'Cerita Anak', 'rina@kids.com', 'UNY', 4),
(5, 'Budi', '', 'Santoso', 'Psikolog klinis.', 'Psikologi Dasar', 'budi@psy.com', 'UGM', 5);

-- Tabel Pengunjung
CREATE TABLE IF NOT EXISTS Pengunjung (
    No_Pengunjung INT PRIMARY KEY,
    FNama VARCHAR(100),
    MNama VARCHAR(100),
    LNama VARCHAR(100),
    Alamat VARCHAR(255),
    Umur INT,
    No_Hp VARCHAR(20)
);
INSERT INTO Pengunjung VALUES
(1, 'Ani', '', 'Yuliani', 'Jl. Melati No.1', 20, '081234567891'),
(2, 'Budi', '', 'Santoso', 'Jl. Mawar No.2', 22, '082345678912'),
(3, 'Citra', '', 'Lestari', 'Jl. Kenanga No.3', 25, '083456789123'),
(4, 'Dodi', '', 'Saputra', 'Jl. Dahlia No.4', 18, '084567891234'),
(5, 'Eka', '', 'Ramadhan', 'Jl. Anggrek No.5', 30, '085678912345');

-- Tabel Admin
CREATE TABLE IF NOT EXISTS Admin (
    No_Admin INT PRIMARY KEY,
    Karyawan VARCHAR(100)
);
INSERT INTO Admin VALUES
(1, 'Sari'), (2, 'Rian'), (3, 'Dewi'), (4, 'Andi'), (5, 'Lina');

-- Tabel Penerbit
CREATE TABLE IF NOT EXISTS Penerbit (
    ID_Penerbit INT PRIMARY KEY,
    FNama VARCHAR(100),
    MNama VARCHAR(100),
    LNama VARCHAR(100),
    Tahun_Terbit INT,
    Alamat VARCHAR(255),
    Informasi_Kontak VARCHAR(100),
    ID_Buku INT,
    FOREIGN KEY (ID_Buku) REFERENCES Buku(ID_Buku)
);
INSERT INTO Penerbit VALUES
(1, 'Gramedia', '', 'Pustaka', 2005, 'Jakarta', '021-1234567', 1),
(2, 'History', '', 'Press', 2000, 'Bandung', '022-7654321', 2),
(3, 'Tech', '', 'Media', 2010, 'Surabaya', '031-1112223', 3),
(4, 'Kids', '', 'Publisher', 2015, 'Semarang', '024-4445556', 4),
(5, 'Mental', '', 'House', 2012, 'Yogyakarta', '0274-888999', 5);

-- Tabel Karya_Terdahulu
CREATE TABLE IF NOT EXISTS Karya_Terdahulu (
    ID_Terdahulu INT,
    Karya_Buku_Terdahulu VARCHAR(255),
    PRIMARY KEY (Karya_Buku_Terdahulu)
);
INSERT INTO Karya_Terdahulu VALUES
(1, 'Ayah'), (2, 'Perang Dunia Kedua'), (3, 'PHP Dasar'), (4, 'Petualangan Si Kancil'), (5, 'Psikologi Remaja');

-- Tabel Sewa
CREATE TABLE IF NOT EXISTS Sewa (
    No_Pengunjung INT,
    ID_Buku INT,
    quantity INT,
    selama VARCHAR(50),
    biaya FLOAT,
    Id_admin INT,
    PRIMARY KEY (No_Pengunjung, ID_Buku),
    FOREIGN KEY (No_Pengunjung) REFERENCES Pengunjung(No_Pengunjung),
    FOREIGN KEY (ID_Buku) REFERENCES Buku(ID_Buku),
    FOREIGN KEY (Id_admin) REFERENCES Admin(No_Admin)
);
INSERT INTO Sewa VALUES
(1, 1, 1, '7 hari', 10000, 1),
(2, 2, 1, '5 hari', 8000, 2),
(3, 3, 2, '10 hari', 20000, 3),
(4, 4, 1, '3 hari', 6000, 4),
(5, 5, 1, '7 hari', 12000, 5);

-- Tabel Kembali
CREATE TABLE IF NOT EXISTS Kembali (
    ID_Buku INT,
    No_Pengunjung INT,
    Denda INT,
    PRIMARY KEY (ID_Buku, No_Pengunjung),
    FOREIGN KEY (ID_Buku) REFERENCES Buku(ID_Buku),
    FOREIGN KEY (No_Pengunjung) REFERENCES Pengunjung(No_Pengunjung)
);
INSERT INTO Kembali VALUES
(1, 1, 0), (2, 2, 1000), (3, 3, 0), (4, 4, 2000), (5, 5, 0);

-- Relasi keseluruhan
SELECT 
    s.No_Pengunjung,
    CONCAT(p.FNama, ' ', p.MNama, ' ', p.LNama) AS Nama_Pengunjung,
    b.ID_Buku,
    b.Nama AS Judul_Buku,
    b.Kategori,
    b.Jenis_buku,
    s.quantity,
    s.selama,
    s.biaya,
    a.Karyawan AS Admin_Penanggung_Jawab
FROM Sewa s
JOIN Pengunjung p ON s.No_Pengunjung = p.No_Pengunjung
JOIN Buku b ON s.ID_Buku = b.ID_Buku
LEFT JOIN Admin a ON s.Id_admin = a.No_Admin;

-- menampilkan buku ,jenis_buku dan kategori_buku
SELECT 
    b.ID_Buku,
    b.Nama AS Judul_Buku,
    k.Kategori_Buku,
    j.Nama_jenis
FROM Buku b
JOIN Kategori k ON b.Kategori = k.Kategori_Buku
JOIN Jenis_Buku j ON b.Jenis_buku = j.Nama_jenis;

-- buku, penulis
SELECT 
    b.ID_Buku,
    b.Nama AS Judul_Buku,
    CONCAT(pn.FNama, ' ', pn.MNama, ' ', pn.LNama) AS Nama_Penulis,
    pn.Biografi,
    pn.Karya_Terdahulu,
    pn.Kontak,
    pn.Riwayat_Pendidikan
FROM Buku b
JOIN Penulis pn ON b.ID_Buku = pn.ID_Buku;

-- buku, penerbit
SELECT 
    b.ID_Buku,
    b.Nama AS Judul_Buku,
    CONCAT(p.FNama, ' ', p.MNama, ' ', p.LNama) AS Nama_Penerbit,
    p.Tahun_Terbit,
    p.Alamat,
    p.Informasi_Kontak
FROM Buku b
JOIN Penerbit p ON b.ID_Buku = p.ID_Buku;

-- Pengunjung, kembali, buku
SELECT 
    k.No_Pengunjung,
    CONCAT(pg.FNama, ' ', pg.MNama, ' ', pg.LNama) AS Nama_Pengunjung,
    b.Nama AS Judul_Buku,
    k.Denda
FROM Kembali k
JOIN Pengunjung pg ON k.No_Pengunjung = pg.No_Pengunjung
JOIN Buku b ON k.ID_Buku = b.ID_Buku;

-- relasi pengunjung, sewa, buku, admin
SELECT 
    pg.No_Pengunjung,
    CONCAT(pg.FNama, ' ', pg.MNama, ' ', pg.LNama) AS Nama_Pengunjung,
    b.Nama AS Judul_Buku,
    b.Kategori,
    b.Jenis_buku,
    s.quantity,
    s.selama,
    s.biaya,
    a.Karyawan AS Admin_Yang_Melayani
FROM Sewa s
JOIN Pengunjung pg ON s.No_Pengunjung = pg.No_Pengunjung
JOIN Buku b ON s.ID_Buku = b.ID_Buku
JOIN Admin a ON s.Id_admin = a.No_Admin;

-- Menampilkan semua data dari masing-masing tabel

SELECT * FROM Kategori;
SELECT * FROM Jenis_Buku;
SELECT * FROM Buku;
SELECT * FROM Penulis;
SELECT * FROM Pengunjung;
SELECT * FROM Admin;
SELECT * FROM Penerbit;
SELECT * FROM Karya_Terdahulu;
SELECT * FROM Sewa;
SELECT * FROM Kembali;
