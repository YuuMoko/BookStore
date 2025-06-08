CREATE TABLE tb_user (
    uid VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    code VARCHAR(255),
    state TINYINT NOT NULL
);

CREATE TABLE category (
    cid VARCHAR(255) PRIMARY KEY,
    cname VARCHAR(255) NOT NULL
);

CREATE TABLE book (
    bid VARCHAR(255) PRIMARY KEY,
    bname VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    author VARCHAR(255) NOT NULL,
    image VARCHAR(255),
    cid VARCHAR(255),
    del TINYINT NOT NULL,
    FOREIGN KEY (cid) REFERENCES category(cid)
);

CREATE TABLE orders (
    oid VARCHAR(255) PRIMARY KEY,
    ordertime DATETIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    state INT NOT NULL,
    owner_uid VARCHAR(255),
    address VARCHAR(255),
    FOREIGN KEY (owner_uid) REFERENCES tb_user(uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE orderitem (
    iid VARCHAR(255) PRIMARY KEY,
    count INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    oid VARCHAR(255),
    bid VARCHAR(255),
    FOREIGN KEY (oid) REFERENCES orders(oid),
    FOREIGN KEY (bid) REFERENCES book(bid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE adminuser (
    auid      VARCHAR(32)  NOT NULL COMMENT '管理员唯一ID' PRIMARY KEY,
    adminname VARCHAR(50)  NOT NULL COMMENT '管理员用户名',
    password  VARCHAR(100) NOT NULL COMMENT '密码（建议存储加密值）'
) ENGINE = InnoDB COLLATE = utf8mb4_unicode_ci;