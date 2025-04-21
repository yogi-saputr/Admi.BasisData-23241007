USE perpustakaan;

DESCRIBE buku;

-- INSERT INTO Kategori (Kategori_Buku) VALUES 
-- ('Fiksi'),
-- ('Non-Fiksi'),
-- ('Biografi'),
-- ('Ilmiah'),
-- ('Komik');

-- INSERT INTO Jenis_Buku (Nama_jenis) VALUES 
-- ('Novel'),
-- ('Majalah'),
-- ('Ensiklopedia'),
-- ('Cerita Bergambar'),
-- ('Jurnal');

-- INSERT INTO Buku (ID_Buku, Nama, Kategori, Jenis_buku) VALUES 
-- (1, 'Laskar Pelangi', 'Fiksi', 'Novel'),
-- (2, 'Ensiklopedia Sains', 'Ilmiah', 'Ensiklopedia'),
-- (3, 'Komik Naruto', 'Komik', 'Cerita Bergambar'),
-- (4, 'Biografi Soekarno', 'Biografi', 'Jurnal'),
-- (5, 'Majalah Nasional', 'Non-Fiksi', 'Majalah');


-- menampilkan jenis buku
-- SELECT * FROM jenis_buku;

-- menampilkan buku ,jenis_buku dan kategori_buku
SELECT 
    b.ID_Buku,
    b.Nama AS Judul_Buku,
    k.Kategori_Buku,
    j.Nama_jenis
FROM Buku b
JOIN Kategori k ON b.Kategori = k.Kategori_Buku
JOIN Jenis_Buku j ON b.Jenis_buku = j.Nama_jenis;

