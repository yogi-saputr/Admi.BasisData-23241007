USE Perpustakaan;

-- Tabel Kategori
CREATE TABLE Kategori (
    Kategori_Buku VARCHAR(100) PRIMARY KEY
);

-- Tabel Jenis_Buku
CREATE TABLE Jenis_Buku (
    Nama_jenis VARCHAR(100) PRIMARY KEY
);

-- Tabel Buku
CREATE TABLE Buku (
    ID_Buku INT PRIMARY KEY,
    Nama VARCHAR(255),
    Kategori VARCHAR(100),
    Jenis_buku VARCHAR(100),
    FOREIGN KEY (Kategori) REFERENCES Kategori(Kategori_Buku),
    FOREIGN KEY (Jenis_buku) REFERENCES Jenis_Buku(Nama_jenis)
);

-- Tabel Pengunjung
CREATE TABLE Pengunjung (
    No_Pengunjung INT PRIMARY KEY,
    FNama VARCHAR(100),
    MNama VARCHAR(100),
    LNama VARCHAR(100),
    Alamat VARCHAR(255),
    Umur INT,
    No_Hp VARCHAR(20)
);

-- Tabel Admin
CREATE TABLE Admin (
    No_Admin INT PRIMARY KEY,
    Karyawan VARCHAR(100)
);

-- Tabel Sewa
CREATE TABLE Sewa (
    No_Pengunjung INT,
    ID_Buku INT,
    quantity INT,
    selama VARCHAR(50),
    biaya FLOAT,
    Id_admin VARCHAR(50),
    PRIMARY KEY (No_Pengunjung, ID_Buku),
    FOREIGN KEY (No_Pengunjung) REFERENCES Pengunjung(No_Pengunjung),
    FOREIGN KEY (ID_Buku) REFERENCES Buku(ID_Buku)
);

-- Tabel Kembali
CREATE TABLE Kembali (
    ID_Buku INT,
    No_Pengunjung INT,
    Denda INT,
    PRIMARY KEY (ID_Buku, No_Pengunjung),
    FOREIGN KEY (ID_Buku) REFERENCES Buku(ID_Buku),
    FOREIGN KEY (No_Pengunjung) REFERENCES Pengunjung(No_Pengunjung)
);

-- Tabel Penerbit
CREATE TABLE Penerbit (
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

-- Tabel Penulis
CREATE TABLE Penulis (
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

-- Tabel Karya_Terdahulu
CREATE TABLE Karya_Terdahulu (
    Karya_Buku_Terdahulu VARCHAR(255) PRIMARY KEY
);