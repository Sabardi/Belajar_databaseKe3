# join Table & View Worksheet 4
================== 4.1 ==================
1.SELECT pesanan.id, pesanan.tanggal, pesanan. total, pelanggan.kode, pelanggan.nama, 
    -> kartu.nama as nama_kartu, kartu.diskon
    -> FROM pesanan INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
    -> INNER JOIN kartu ON pelanggan.kartu_id = kartu.id;

    +----+------------+---------+------+--------------------+---------------+--------+
| id | tanggal    | total   | kode | nama               | nama_kartu    | diskon |
+----+------------+---------+------+--------------------+---------------+--------+
|  1 | 2015-11-04 | 9720000 | C001 | Agung Sedayu Group | Gold Utama    |   0.05 |
|  2 | 2015-11-04 |   17500 | C003 | Sekar Mirah        | Gold Utama    |   0.05 |
|  3 | 2015-11-04 |       0 | C006 | Gayatri Dwi        | Gold Utama    |   0.05 |
|  4 | 2015-11-04 |       0 | C007 | Dewi Gyat          | Gold Utama    |   0.05 |
|  5 | 2015-11-04 |       0 | C010 | Cassanndra         | Gold Utama    |   0.05 |
|  6 | 2015-11-04 |       0 | C002 | Pandan Wangi       | Platinum Jaya |    0.1 |
|  7 | 2015-11-04 |       0 | C005 | Pradabashu         | Platinum Jaya |    0.1 |
|  8 | 2015-11-04 |       0 | C004 | Swandaru Geni      | Non Member    |      0 |
|  9 | 2015-11-04 |       0 | C008 | Andre Haru         | Non Member    |      0 |
| 10 | 2015-11-04 |       0 | C009 | Ahmad Hasan        | Non Member    |      0 |
| 11 | 2015-11-04 |   30000 | C009 | Ahmad Hasan        | Non Member    |      0 |
+----+------------+---------+------+--------------------+---------------+--------+
11 rows in set (0,006 sec)

2. SELECT pembelian.id, pembelian.tanggal, pembelian.nomor, pembelian.jumlah, pembelian.harga,
    -> produk.nama, vendor.nama, vendor.kontak FROM pembelian INNER JOIN produk 
    -> ON pembelian.produk_id = produk.id 
    -> INNER JOIN vendor ON pembelian.vendor_id = vendor.id;
+----+------------+-------+--------+---------+-------------------+----------------------+-----------------+
| id | tanggal    | nomor | jumlah | harga   | nama              | nama                 | kontak          |
+----+------------+-------+--------+---------+-------------------+----------------------+-----------------+
|  1 | 2019-10-10 | P001  |      2 | 3500000 | Televisi 21 inchs | PT Guna Samudra      | Ali Nurdin      |
|  2 | 2019-11-20 | P002  |      5 | 5500000 | Televisi 40 inch  | PT Pondok C9         | Putri Ramadhani |
|  3 | 2019-12-12 | P003  |      5 | 5400000 | Televisi 40 inch  | PT Guna Samudra      | Ali Nurdin      |
|  4 | 2020-01-20 | P004  |    200 |    1800 | Teh Botol         | CV Jaya Raya Semesta | Dwi Rahayu      |
|  5 | 2020-01-20 | P005  |    100 |    2300 | Teh Kotak         | CV Jaya Raya Semesta | Dwi Rahayu      |
+----+------------+-------+--------+---------+-------------------+----------------------+-----------------+
5 rows in set (0,001 sec)

3. SELECT pesanan.id, pesanan.tanggal, pelanggan.nama AS 'Nama Pelanggan', pesanan.total, produk.kode, produk.nama 'Nama Produk',
jenis_produk.nama AS 'Jenis Produk', pesanan_items.qty, pesanan_items.harga FROM pesanan
-> INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
-> INNER JOIN pesanan_items ON pesanan.id = pesanan_items.pesanan_id
-> INNER JOIN produk ON pesanan_items.produk_id = produk.id
-> INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;

+----+------------+---------+--------------------+------+-------------------+--------------+------+---------+
| id | tanggal    | total   | Nama Pelanggan     | kode | Nama Produk       | Jenis Produk | qty  | harga   |
+----+------------+---------+--------------------+------+-------------------+--------------+------+---------+
|  1 | 2015-11-04 | 9720000 | Agung Sedayu Group | TV01 | Televisi 21 inchs | elektroniks  |    1 | 5040000 |
|  1 | 2015-11-04 | 9720000 | Agung Sedayu Group | K001 | Kulkas 2 pintu    | elektroniks  |    1 | 4680000 |
|  2 | 2015-11-04 |   17500 | Sekar Mirah        | TK01 | Teh Kotak         | minuman      |    5 |    3500 |
|  3 | 2015-11-04 |       0 | Gayatri Dwi        | TK01 | Teh Kotak         | minuman      |   10 |    3500 |
|  3 | 2015-11-04 |       0 | Gayatri Dwi        | TV01 | Televisi 21 inchs | elektroniks  |    1 | 5040000 |
|  5 | 2015-11-04 |       0 | Cassanndra         | TK01 | Teh Kotak         | minuman      |   10 |    3500 |
|  6 | 2015-11-04 |       0 | Pandan Wangi       | TK01 | Teh Kotak         | minuman      |   20 |    3500 |
+----+------------+---------+--------------------+------+-------------------+--------------+------+---------+




================== 4.2 ==================
1.  CREATE VIEW pesanan_pelanggan_kartu
    -> AS SELECT pesanan.id, pesanan.tanggal, pesanan. total, pelanggan.kode, pelanggan.nama, 
    -> kartu.nama as nama_kartu, kartu.diskon
    -> FROM pesanan INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
    -> INNER JOIN kartu ON pelanggan.kartu_id = kartu.id;
Query OK, 0 rows affected (0,005 sec)
 select * from pesanan_pelanggan_kartu;
+----+------------+---------+------+--------------------+---------------+--------+
| id | tanggal    | total   | kode | nama               | nama_kartu    | diskon |
+----+------------+---------+------+--------------------+---------------+--------+
|  1 | 2015-11-04 | 9720000 | C001 | Agung Sedayu Group | Gold Utama    |   0.05 |
|  2 | 2015-11-04 |   17500 | C003 | Sekar Mirah        | Gold Utama    |   0.05 |
|  3 | 2015-11-04 |       0 | C006 | Gayatri Dwi        | Gold Utama    |   0.05 |
|  4 | 2015-11-04 |       0 | C007 | Dewi Gyat          | Gold Utama    |   0.05 |
|  5 | 2015-11-04 |       0 | C010 | Cassanndra         | Gold Utama    |   0.05 |
|  6 | 2015-11-04 |       0 | C002 | Pandan Wangi       | Platinum Jaya |    0.1 |
|  7 | 2015-11-04 |       0 | C005 | Pradabashu         | Platinum Jaya |    0.1 |
|  8 | 2015-11-04 |       0 | C004 | Swandaru Geni      | Non Member    |      0 |
|  9 | 2015-11-04 |       0 | C008 | Andre Haru         | Non Member    |      0 |
| 10 | 2015-11-04 |       0 | C009 | Ahmad Hasan        | Non Member    |      0 |
| 11 | 2015-11-04 |   30000 | C009 | Ahmad Hasan        | Non Member    |      0 |
+----+------------+---------+------+--------------------+---------------+--------+
11 rows in set (0,001 sec)

2. SELECT * FROM vendor;
+----+-------+----------------------+----------+-----------------+
| id | nomor | nama                 | kota     | kontak          |
+----+-------+----------------------+----------+-----------------+
|  1 | V001  | PT Guna Samudra      | Surabaya | Ali Nurdin      |
|  2 | V002  | PT Pondok C9         | Depok    | Putri Ramadhani |
|  3 | V003  | CV Jaya Raya Semesta | Jakarta  | Dwi Rahayu      |
|  4 | V004  | PT Lekulo X          | Kebumen  | Mbambang G      |
|  5 | V005  | PT IT Prima          | Jakarta  | David W         |
+----+-------+----------------------+----------+-----------------+
5 rows in set (0,001 sec)

CREATE VIEW pembelian_produk_vendor  AS SELECT p.id, p.tanggal, p.nomor, p.jumlah, p.harga, pr.nama, v.nama as nama_vendor, v.kontak FROM pembelian p INNER JOIN produk pr ON p.produk_id = pr.id  INNER JOIN vendor v ON p.vendor_id = v.id;
Query OK, 0 rows affected (0,005 sec)


select * from pembelian_produk_vendor;
+----+------------+-------+--------+---------+-------------------+----------------------+-----------------+
| id | tanggal    | nomor | jumlah | harga   | nama              | nama_vendor          | kontak          |
+----+------------+-------+--------+---------+-------------------+----------------------+-----------------+
|  1 | 2019-10-10 | P001  |      2 | 3500000 | Televisi 21 inchs | PT Guna Samudra      | Ali Nurdin      |
|  2 | 2019-11-20 | P002  |      5 | 5500000 | Televisi 40 inch  | PT Pondok C9         | Putri Ramadhani |
|  3 | 2019-12-12 | P003  |      5 | 5400000 | Televisi 40 inch  | PT Guna Samudra      | Ali Nurdin      |
|  4 | 2020-01-20 | P004  |    200 |    1800 | Teh Botol         | CV Jaya Raya Semesta | Dwi Rahayu      |
|  5 | 2020-01-20 | P005  |    100 |    2300 | Teh Kotak         | CV Jaya Raya Semesta | Dwi Rahayu      |
+----+------------+-------+--------+---------+-------------------+----------------------+-----------------+
5 rows in set (0,001 sec)

3. CREATE VIEW penjualan_produk AS SELECT pesanan.id AS id,pesanan.total AS total,
    -> pelanggan.nama AS nama_pelanggan,
    -> produk.kode AS kode_produk,produk.nama AS nama_produk,
    -> jenis_produk.nama AS jenis_produk,
    -> pesanan_items.qty AS qty, pesanan_items.harga AS harga_jual
    -> FROM pesanan
    -> INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
    -> INNER JOIN pesanan_items ON pesanan.id = pesanan_items.pesanan_id
    -> INNER JOIN produk ON pesanan_items.produk_id = produk.id
    -> INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
Query OK, 0 rows affected (0,005 sec)

SELECT * FROM penjualan_produk;
+----+---------+--------------------+-------------+-------------------+--------------+------+------------+
| id | total   | nama_pelanggan     | kode_produk | nama_produk       | jenis_produk | qty  | harga_jual |
+----+---------+--------------------+-------------+-------------------+--------------+------+------------+
|  1 | 9720000 | Agung Sedayu Group | TV01        | Televisi 21 inchs | elektroniks  |    1 |    5040000 |
|  1 | 9720000 | Agung Sedayu Group | K001        | Kulkas 2 pintu    | elektroniks  |    1 |    4680000 |
|  2 |   17500 | Sekar Mirah        | TK01        | Teh Kotak         | minuman      |    5 |       3500 |
|  3 |       0 | Gayatri Dwi        | TK01        | Teh Kotak         | minuman      |   10 |       3500 |
|  3 |       0 | Gayatri Dwi        | TV01        | Televisi 21 inchs | elektroniks  |    1 |    5040000 |
|  5 |       0 | Cassanndra         | TK01        | Teh Kotak         | minuman      |   10 |       3500 |
|  6 |       0 | Pandan Wangi       | TK01        | Teh Kotak         | minuman      |   20 |       3500 |
+----+---------+--------------------+-------------+-------------------+--------------+------+------------+
7 rows in set (0,001 sec)



================== 4.3 ================== 

1. Mulai transactio
    START TRANSACTION;
2. insert data produk sebanyak 3 record
INSERT INTO produk ( kode, nama, harga_beli, harga_jual, stok, min_stok, foto, deskripsi, jenis_produk_id) VALUES 
('hp02', 'samsung', 5000000, 6000000, 30, 5, 'samsung,jpg', 'barang baru datang', 1),
('hp04', 'infinix', 2000000, 3000000, 30, 5, 'infinix,jpg', 'barang baru datang', 1),
('hp303', 'vivo', 4000000, 5000000, 30, 5, 'vivo,jpg', 'barang baru datang', 1);

3. update data stok salah satu produk
update produk set stok = 10 where id=32;

4. Buat savepoint
SAVEPOINT sebelum_hapus;

5. Hapus salah satu data pembayaran
    DELETE FROM pembayaran WHERE id_pembayaran = 1;

6. Kembali ke savepoint
    ROLLBACK TO SAVEPOINT sebelum_hapus;

7. Update data iuran salah satu kartu
    UPDATE kartu SET iuran = 150000 WHERE id = 1;

8. Akhiri transaction dengan commit
    COMMIT;


soal 2:
Berikan penjelasan kapan saat yang tepat menggunakan LOCK TABLES READ
digunakan ketika ingin mencegah perubahan data pada tabel tertentu selama proses bacaan (read) sedang dilakukan oleh transaksi atau Query lain

soal 3:
Berikan penjelasan kapan saat yang tepat menggunakan LOCK TABLES WRITE
digunakan ketika ingin mencegah perubahan data pada tabel tertentu oleh transaksi atau query lain selama proses penulisan (write) sedang dilakukan

