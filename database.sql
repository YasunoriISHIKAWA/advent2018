CREATE DATABASE line;

CREATE TABLE line.yamanote_line (
    id INT PRIMARY KEY,
    name STRING
);

INSERT INTO line.yamanote_line (id, name)
  VALUES
    (1, '東京'),
    (2, '神田'),
    (3, '秋葉原'),
    (4, '御徒町'),
    (5, '上野'),
    (6, '鶯谷'),
    (7, '日暮里'),
    (8, '西日暮里'),
    (9, '田端'),
    (10, '駒込'),
    (11, '巣鴨'),
    (12, '大塚'),
    (13, '池袋'),
    (14, '目白'),
    (15, '高田馬場'),
    (16, '新大久保'),
    (17, '新宿'),
    (18, '代々木'),
    (19, '原宿'),
    (20, '渋谷'),
    (21, '恵比寿'),
    (22, '目黒'),
    (23, '五反田'),
    (24, '大崎'),
    (25, '品川'),
    (26, '高輪ゲートウェイ'),
    (27, '田町'),
    (28, '浜松町'),
    (29, '新橋'),
    (30, '有楽町');

CREATE USER maxroach;

GRANT ALL ON TABLE line.* TO maxroach;
