USE db_cps;

CREATE TABLE Medicamentos (
  medicamento_id INT PRIMARY KEY,
  nombre_medicamento VARCHAR(100),
  precio_unitario DECIMAL(4,2)
);

CREATE TABLE Banco (
  banco_id INT PRIMARY KEY,
  nombre_banco VARCHAR(100),
  ciudad VARCHAR(20),
  direccion VARCHAR(200)
);

CREATE TABLE Categoria (
  categoria_id INT PRIMARY KEY,
  nombre_categoria VARCHAR(50)
);

CREATE TABLE Reguladores (
  id_regulador INT PRIMARY KEY,
  nombre_regulador VARCHAR(100),
  telofono VARCHAR(20),
  cargo VARCHAR(80)
);

CREATE TABLE Subasta (
  subasta_id INT PRIMARY KEY,
  fecha_inicio DATE,
  fecha_finalizacion DATE,
  idRegulador INT,
  FOREIGN KEY (idRegulador) REFERENCES Reguladores(id_regulador)
);

CREATE TABLE Instituto (
  instituto_id INT PRIMARY KEY,
  nombre_instituto VARCHAR(100),
  direccion VARCHAR(200),
  idCategoria INT,
  FOREIGN KEY (idCategoria) REFERENCES Categoria(categoria_id)
);

CREATE TABLE Transferencia (
  transferencia_id INT PRIMARY KEY,
  fecha DATE,
  costo_total INT,
  idBanco INT,
  idInstituto INT,
  idSubasta INT,
  FOREIGN KEY (idBanco) REFERENCES Banco(banco_id),
  FOREIGN KEY (idInstituto) REFERENCES Instituto(instituto_id),
  FOREIGN KEY (idSubasta) REFERENCES Subasta(subasta_id)
);

CREATE TABLE Transferencia_Medicamento (
  idMedicamento INT,
  idTransferencia INT,
  FOREIGN KEY (idMedicamento) REFERENCES Medicamentos(medicamento_id),
  FOREIGN KEY (idTransferencia) REFERENCES Transferencia(transferencia_id)
);


INSERT INTO Medicamentos(medicamento_id, nombre_medicamento, precio_unitario)
VALUES (1, 'Beclometasona', 60.00);

INSERT INTO Banco(banco_id, nombre_banco, ciudad, direccion)
VALUES (1, 'Banco Union', 'La Paz', 'Calle 1 de la avenida siempre viva');

INSERT INTO Categoria(categoria_id, nombre_categoria)
VALUES (1, 'Departamental');

INSERT INTO Reguladores(id_regulador, nombre_regulador, telofono, cargo)
VALUES (1, 'Juan Juanales', '123456', 'Director Recursos Medicos');

INSERT INTO Subasta(subasta_id, fecha_inicio, fecha_finalizacion, idRegulador)
VALUES (1, '2023-10-12', '2023-10-13', 1);

INSERT INTO Instituto(instituto_id, nombre_instituto, direccion, idCategoria)
VALUES (1, 'Administracion SantaCruz', 'Calle 2 Baticueva', 1);

INSERT INTO Transferencia(transferencia_id, fecha, costo_total, idBanco, idInstituto, idSubasta)
VALUES (1, '2023-10-14', 1236, 1, 1, 1);

INSERT INTO Transferencia_Medicamento(idMedicamento, idTransferencia)
VALUES (1, 1);
