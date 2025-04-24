USE Perpustakaan;

-- SELECT 1 Kolom
-- 1. Buku
SELECT b.Nama AS Judul_Buku FROM Buku b;

-- 2. Kategori
SELECT k.Kategori_Buku AS Kode_Kategori FROM Kategori k;

-- 3. Jenis_Buku
SELECT j.Nama_jenis AS Jenis FROM Jenis_Buku j;

-- 4. Admin
SELECT a.Karyawan AS Nama_Admin FROM Admin a;

-- 5. Penulis
SELECT p.FNama AS Nama_Depan_Penulis FROM Penulis p;

-- 6. Penerbit
SELECT pn.FNama AS Nama_Penerbit FROM Penerbit pn;

-- 7. Pengunjung
SELECT pg.Umur AS Usia FROM Pengunjung pg;

-- 8. Sewa
SELECT s.biaya AS Biaya_Sewa FROM Sewa s;

-- 9. Kembali
SELECT kmb.Denda AS Denda_Kembali FROM Kembali kmb;

-- 10. Karya_Terdahulu
SELECT kt.Karya_Buku_Terdahulu AS Judul_Karya FROM Karya_Terdahulu kt;


-- SELECT 2 Kolom
-- 1. Buku
SELECT b.ID_Buku AS ID_Buku, b.Nama AS Judul FROM Buku b;

-- 2. Kategori
SELECT k.Kategori_Buku AS Kategori_ID, k.Kategori_Buku AS Nama_Kategori FROM Kategori k;

-- 3. Jenis_Buku
SELECT j.Nama_jenis AS ID_Jenis, j.Nama_jenis AS Tipe_Jenis FROM Jenis_Buku j;

-- 4. Admin
SELECT a.No_Admin AS ID_Admin, a.Karyawan AS Petugas FROM Admin a;

-- 5. Penulis
SELECT p.ID_Penulis AS ID_Penulis, p.LNama AS Nama_Akhir FROM Penulis p;

-- 6. Penerbit
SELECT pn.ID_Penerbit AS ID_Penerbit, pn.Tahun_Terbit AS Tahun FROM Penerbit pn;

-- 7. Pengunjung
SELECT pg.No_Pengunjung AS ID_Pengunjung, pg.No_Hp AS HP FROM Pengunjung pg;

-- 8. Sewa
SELECT s.ID_Buku AS Buku_ID, s.quantity AS Jumlah FROM Sewa s;

-- 9. Kembali
SELECT kmb.ID_Buku AS ID_Buku_Kembali, kmb.Denda AS Nominal_Denda FROM Kembali kmb;

-- 10. Karya_Terdahulu
SELECT kt.Karya_Buku_Terdahulu AS Judul, kt.Karya_Buku_Terdahulu AS Karya FROM Karya_Terdahulu kt;


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