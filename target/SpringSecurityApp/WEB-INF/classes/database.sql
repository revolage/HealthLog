/*
-- Table for mapping patients and roles: user_roles
CREATE TABLE user_roles(
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES patients(id),
  FOREIGN KEY (role_id) REFERENCES roles(id),
  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;
*/

-- Insert data
/*INSERT INTO patients VALUES (1,'vlad', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5rluwFu7HgtRn3dcXG');*/
/*
INSERT INTO roles VALUES (1,'ROLE_USER');
INSERT INTO roles VALUES (2,'ROLE_ADMIN');
*/
INSERT INTO user_roles VALUES (1,2);


