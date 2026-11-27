

CREATE TABLE IF NOT EXISTS yemek(
    yemek_id SERIAL PRIMARY KEY ,
    yemek_isim TEXT NOT NULL,
    yemek_fiyat INT NOT NULL
);



CREATE TABLE IF NOT EXISTS restorant(
    restorant_id SERIAL PRIMARY KEY,
    restorant_isim TEXT NOT NULL,
    restorant_adres TEXT NOT NULL,
    restorant_yildiz INT NOT NULL
);

CREATE TABLE IF NOT EXISTS restorant_yemek(
    yemek_id INT NOT NULL,
    restorant_id INT NOT NULL,
    FOREIGN KEY (yemek_id) REFERENCES yemek(yemek_id),
    FOREIGN KEY (restorant_id) REFERENCES restorant(restorant_id),
    PRIMARY KEY (yemek_id, restorant_id)
);

CREATE TABLE IF NOT EXISTS malzeme(
    malzeme_id SERIAL PRIMARY KEY,
    malzeme_isim TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS yemek_malzeme(
    yemek_id INT NOT NULL,
    malzeme_id INT NOT NULL,
    miktar INT NOT NULL,
    FOREIGN KEY (yemek_id) REFERENCES yemek(yemek_id),
    FOREIGN KEY (malzeme_id) REFERENCES malzeme(malzeme_id),
    PRIMARY KEY (yemek_id, malzeme_id)
);



CREATE TABLE IF NOT EXISTS depo(
    restorant_id INT NOT NULL,
    malzeme_id INT NOT NULL,
    malzeme_adet INT NOT NULL,
    FOREIGN KEY (restorant_id) REFERENCES restorant(restorant_id),
    FOREIGN KEY (malzeme_id) REFERENCES malzeme(malzeme_id),
    PRIMARY KEY (restorant_id, malzeme_id)
);

CREATE TABLE IF NOT EXISTS kurye(
    kurye_id SERIAL PRIMARY KEY,
    kurye_isim TEXT NOT NULL,
    kurye_tel_no TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS musteri(
    musteri_id SERIAL PRIMARY KEY,
    musteri_isim TEXT NOT NULL,
    musteri_tel_no TEXT NOT NULL,
    musteri_adres TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS siparis(
    siparis_id SERIAL PRIMARY KEY ,
    restorant_id INT NOT NULL,
    musteri_id INT NOT NULL,
    kurye_id INT NOT NULL,
    toplam_tutar INT NOT NULL,
    FOREIGN KEY (restorant_id) REFERENCES restorant(restorant_id),
    FOREIGN KEY (musteri_id) REFERENCES musteri (musteri_id),
    FOREIGN KEY (kurye_id) REFERENCES kurye(kurye_id)
);

CREATE TABLE IF NOT EXISTS siparis_kalem(
    siparis_kalem_id SERIAL PRIMARY KEY,
    siparis_id INT NOT NULL,
    yemek_id INT NOT NULL,
    siparis_adet INT NOT NULL,
    yemek_fiyat INT NOT NULL,
    FOREIGN KEY (siparis_id) REFERENCES siparis (siparis_id),
    FOREIGN KEY (yemek_id) REFERENCES yemek (yemek_id)
);


CREATE TABLE IF NOT EXISTS cuzdan(
    cuzdan_id SERIAL PRIMARY KEY ,
    musteri_id INT NOT NULL UNIQUE,
    musteri_bakiye INT NOT NULL,
    FOREIGN KEY (musteri_id) REFERENCES musteri(musteri_id)
);












