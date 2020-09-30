CREATE DATABASE rekam_medis;
CREATE TABLE dokter(
id_dokter INT NOT NULL,
nama_dokter VARCHAR(100) NOT NULL,
alamat VARCHAR(100),
kota_tinggal VARCHAR(50),
no_tlp VARCHAR(15) NOT NULL,
spesialis VARCHAR(50) NOT NULL,
PRIMARY KEY(id_dokter));

CREATE TABLE petugas_admin(
id_petugas INT NOT NULL,
nama_petugas VARCHAR(100) NOT NULL,
alamat VARCHAR(100),
kota_tinggal VARCHAR(50),
no_tlp VARCHAR(15) NOT NULL,
PRIMARY KEY(id_petugas));

CREATE TABLE pasien(
id_pasien INT NOT NULL,
nama_pasien VARCHAR(100) NOT NULL,
tgl_lahir DATE,
tempat_lahir VARCHAR(50),
alamat VARCHAR(100),
kota_tinggal VARCHAR(50),
no_tlp VARCHAR(15) NOT NULL,
pekerjaan VARCHAR(50),
PRIMARY KEY(id_pasien));

CREATE TABLE obat(
id_obat INT NOT NULL,
kategori_obat CHAR(3) NOT NULL,
nama_obat VARCHAR(100),
bentuk_obat VARCHAR(100),
tgl_kadaluarsa DATE NOT NULL,
harga_obat NUMERIC,
PRIMARY KEY(id_obat));

CREATE TABLE rekam_medis(
id_rekam_medis INT NOT NULL,
id_pasien INT NOT NULL,
id_petugas INT NOT NULL,
id_dokter INT NOT NULL,
tgl_periksa DATE NOT NULL,
diagnosa TEXT,
keterangan VARCHAR(100),
biaya_jasa NUMERIC NOT NULL,
PRIMARY KEY(id_rekam_medis),
CONSTRAINT fk_id_pasien FOREIGN KEY(id_pasien) REFERENCES pasien(id_pasien),
CONSTRAINT fk_id_petugas FOREIGN KEY(id_petugas) REFERENCES petugas_admin(id_petugas),
CONSTRAINT fk_id_dokter FOREIGN KEY(id_dokter) REFERENCES dokter(id_dokter));

CREATE TABLE resep_obat(
id_resep INT NOT NULL,
id_obat INT NOT NULL,
id_rekam_medis INT NOT NULL,
jumlah INT NOT NULL,
PRIMARY KEY(id_resep),
CONSTRAINT fk_id_obat FOREIGN KEY(id_obat) REFERENCES obat(id_obat),
CONSTRAINT fk_id_rekam_medis FOREIGN KEY(id_rekam_medis) REFERENCES rekam_medis(id_rekam_medis));

