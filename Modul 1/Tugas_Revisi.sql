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
