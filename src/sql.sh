#!/bin/bash

CREATE DATABASE wordpress;
CREATE USER 'hyenam'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON wordpress.* TO 'hyenam'@'localhost' WITH GRANT OPTION;
USE wordpress;
