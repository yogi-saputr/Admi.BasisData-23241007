-- NAMA : YOGI SAPUTRA
-- NIM : 23241007
-- Kelas : A
-- Modul : modul 5 : JOIN/(subquery)

USE PTI_mart;

-- JOIN
-- menggabungkan dua buah tabel berdasarkan  kolom yang sama

-- Ambil nama pelanggan yang pernah bertransaksi beserta qty
-- artinya ambil kolom kode_pelanggan, nama_pelanggan, dan qty dari
-- penggabungan tabel penjualan dan tabel pelanggan
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab as tp
JOIN ms_pelanggan_dqlab as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;
-- GROUP BY tp.kode_pelanggan
-- HAVING tp.qty < 4;

-- Praktek 2
-- Menggabungkan dua tabel tanpa memperhatikan relational keys
-- Ambil nama pelanggan yang pernah bertransaksi beserta qty nya
-- menggabumgka tabel penjualan dan tabel pelanggan tanpa 
-- memperhatikan kolom yang menjadi primary key

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab as tp
JOIN ms_pelanggan_dqlab as mp
ON TRUE;


-- INNER JOIN 
-- join yang mengambil data dari dua sisi tabel yang berhubungan 

-- Praktek 3
-- ambil kode pelanggan, nama pelanggan, nama produk, qty
-- dari hasil join tabel penjualan dan tabel pelanggan
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab as tp
INNER JOIN ms_pelanggan_dqlab as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;
 
-- LEFT JOIN
-- join yang mengambil seluruh ata pada sisi tebel sebelah kiri
-- dan hanya mengambil sebgaian data pada sisi kanan
-- yang berelasi saja. bagian yang tidak berelasi akan ditampilkan 
-- sebagai Null

-- Praktek 4
-- Ambil semua nama pelanggan yang pernah bertransaksi + qty
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab as tp
LEFT JOIN ms_pelanggan_dqlab as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- RIGHT JOIN
-- join yang mengambil seluruh data pada sisi tabel sebelah kanan
-- tabel sebelah kiri hanya diambil yang berelasi, jika tidak NULL

-- Praktek 5
-- Ambil semua nama pelanggan yang pernah bertransaksi
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab as tp
RIGHT JOIN ms_pelanggan_dqlab as mp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- Ambil semua nama pelanggan yang tidak pernah bertransaksi
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan_dqlab as tp
RIGHT JOIN ms_pelanggan_dqlab as mp
ON mp.kode_pelanggan = tp.kode_pelanggan
WHERE tp.qty is NULL;

-- Praktek 6
-- ambil kategori prooduk dan nama produk yang di beli oleh pelanggan tapi
-- tampilkan pelanggan beserta namanya

-- alur berpikir cari kolom-kolom yang dibutuhkan
DESCRIBE ms_pelanggan_dqlab;
DESCRIBE ms_produk_dqlab;
DESCRIBE tr_penjualan_dqlab;

SELECT tp.kode_pelanggan, 
mp.nama_pelanggan, 
mpd.kategori_produk, 
tp.nama_produk, 
SUM(tp.qty)
FROM ms_pelanggan_dqlab as mp
LEFT JOIN tr_penjualan_dqlab as tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk_dqlab as mpd
ON mpd.kode_produk = tp.kode_produk
WHERE tp.kode_pelanggan is NOT NULL
GROUP BY tp.kode_pelanggan, mpd.kategori_produk
HAVING SUM(tp.qty) > 4
ORDER BY SUM(tp.qty) DESC;

-- Latihan Mandiri
-- Latihan 1
SELECT *
FROM ms_pelanggan_dqlab AS mp
INNER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd 
ON tp.kode_produk = mpd.kode_produk;

-- Latihan 2
SELECT tp.kode_pelanggan, 
mp.nama_pelanggan, 
mpd.kategori_produk, 
tp.nama_produk, 
tp.qty
FROM ms_pelanggan_dqlab as mp
LEFT JOIN tr_penjualan_dqlab as tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk_dqlab as mpd
ON mpd.kode_produk = tp.kode_produk
WHERE tp.kode_produk is NOT NULL;

-- Latihan 3
SELECT
mpd.kategori_produk,
SUM(tp.qty) AS total_qty
FROM ms_pelanggan_dqlab as mp
INNER JOIN tr_penjualan_dqlab as tp
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab as mpd
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk;

-- Latihan 4 (khusus)
SELECT 
A.kode_produk AS kode_1,
A.nama_produk AS produk_1,
B.kode_produk AS kode_2,
B.nama_produk AS produk_2
FROM ms_produk_dqlab AS A
JOIN ms_produk_dqlab AS B
ON A.kode_produk = B.kode_produk;






