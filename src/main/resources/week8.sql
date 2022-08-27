CREATE TABLE project(
	project_id INT NOT NULL PRIMARY KEY AUTO INCREMENT,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours decimal(7,2), 
	actual_hours decimal(7,2),
	difficulty INT, 
	notes TEXT
);

CREATE TABLE material(
	material_id INT NOT NULL PRIMARY KEY AUTO INCREMENT, 
	project_id int NOT NULL, 
	material_name varchar(128) NOT NULL, 
	num_required INT, 
	cost decimal(7,2)
	project_id NOT NULL FOREIGN KEY REFERENCES project (project_id) ON DELETE CASCADE 
);

CREATE TABLE step(
	step_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	project_id int NOT NULL, 
	step_text TEXTnot NOT NULL, 
	step_order int NOT NULL, 
	project_id NOT NULL FOREIGN KEY REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE cateogry(
	category_id int auto_incrment NOT NULL PRIMARY KEY, 
	cateogry_name varchar(128) NOT NULL
);

CREATE TABLE project_category(
	project_id INT NOT NULL UNIQUE, 
	category_id int NOT NULL   UNIQUE, 
	FOREIGN KEY (project_id)REFERENCES project(project_id),
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE, 
	FOREIGN KEY (category_id)REFERENCES category(category_id) ON DELETE CASCADE
);