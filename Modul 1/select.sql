-- NAMA : YOGI SAPUTRA\
-- NIM : 23241007
-- Kelas : A
-- Modul : Modul 1 - SELECT Statmen, Prefix dan Alias

-- Membuat database baru

CREATE DATABASE  PTI_mart;

-- Menggunakan database PTI-mart
USE PTI_mart;

-- Melihat detail kolom dari tiap tabel
DESCRIBE ms_pelanggan_dqlab;
DESCRIBE ms_produk_dqlab;
DESCRIBE ms_penjualan_dqlab;

-- SELECT statment

-- Mengambil satu kolom dalam tabel produk
SELECT nama_produk FROM ms_produk_dqlab;

-- Mengambil lebih dari satu kolom
SELECT nama_produk, harga FROM ms_produk_dqlab;

-- Mengambil semua kolom pada tabel produk
SELECT * FROM ms_produk_dqlab;

-- Latihan Mandiri
-- Mengambil kolom nama_produk, nama_produk dari ms_produk_dqlab
SELECT kode_produk, nama_produk FROM ms_produk_dqlab;
-- Mengambil semua kolom tr_penjualan_dqlab
SELECT * FROM tr_penjualan_dqlab;


-- Prefix dan alias
-- Prefix
-- Menggunakan PREPIX nama tabel pada kolom nama_produk dari tabel produk
SELECT ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- Menggunakan prefix nama database dan tabel pada kolom nama_produk dari tabel produk
SELECT pti_mart.ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- Alias
-- Menggunakan alias pada kolom nama produk di tabel produk
-- Menggunakan AS
SELECT nama_produk AS np FROM ms_produk_dqlab;
-- tidak menggunakan
SELECT nama_produk np FROM ms_produk_dqlab;

-- Menggunakan alias pada tabel produk dan juga kolom
SELECT nama_produk AS np FROM ms_produk_dqlab AS msp;

-- Menggunakan alias untuk prefix
SELECT msp.nama_produk FROM ms_produk_dqlab AS msp;

-- Ltihan
SELECT msp.nama_pelanggan, msp.alamat FROM ms_pelanggan_dqlab AS msp;

SELECT msp.nama_produk, msp.harga FROM ms_produk_dqlab AS msp;










