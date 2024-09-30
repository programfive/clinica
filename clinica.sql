create database clinica;
use clinica;
CREATE TABLE Persona (
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    fecha_nacimiento DATE,
    sexo VARCHAR(10),
    dni VARCHAR(20)
);

CREATE TABLE Contacto (
    id_contacto INT PRIMARY KEY,
    tipo_contacto VARCHAR(50),
    valor VARCHAR(255),
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Direcciones (
    id_direccion INT PRIMARY KEY,
    calle VARCHAR(255),
    numero VARCHAR(20),
    ciudad VARCHAR(100),
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Personal_administrativo (
    id_personal_administrativo VARCHAR(20) PRIMARY KEY,
    cargo VARCHAR(100),
    departamento VARCHAR(100),
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    numero_colegiado INT,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Especialidad (
    id_especialidad INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    grupo_sanguineo VARCHAR(5),
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Citas (
    id_cita INT PRIMARY KEY,
    fecha_hora DATETIME,
    estado VARCHAR(50),
    id_medico INT,
    id_paciente INT,
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

CREATE TABLE Consultas (
    id_consulta INT PRIMARY KEY,
    diagnostico TEXT,
    id_cita INT,
    FOREIGN KEY (id_cita) REFERENCES Citas(id_cita)
);

CREATE TABLE Tratamiento (
    id_tratamiento INT PRIMARY KEY,
    descripcion TEXT,
    id_consulta INT,
    FOREIGN KEY (id_consulta) REFERENCES Consultas(id_consulta)
);

CREATE TABLE Hospitalizacion (
    id_hospitalizacion INT PRIMARY KEY,
    fecha_inicio DATE,
    fecha_final DATE,
    id_paciente INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

CREATE TABLE Habitaciones (
    numero INT PRIMARY KEY,
    tipo VARCHAR(50),
    estado VARCHAR(50)
);

CREATE TABLE Cirugias (
    id_cirugia INT PRIMARY KEY,
    numero_quirofano INT,
    fecha_hora DATETIME,
    tipo_procedimiento VARCHAR(255),
    id_paciente INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

CREATE TABLE Medicamentos (
    codigo_medicamento INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    stock INT
);

CREATE TABLE Prescripciones (
    numero_factura INT PRIMARY KEY,
    fecha DATE,
    monto_total DECIMAL(10, 2),
    estado VARCHAR(50),
    id_paciente INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

CREATE TABLE Detalles_factura (
    id_detalle INT PRIMARY KEY,
    descripcion VARCHAR(255),
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    numero_factura INT,
    FOREIGN KEY (numero_factura) REFERENCES Prescripciones(numero_factura)
);

-- Procedimientos
DELIMITER //

-- Procedimiento para insertar en la tabla Persona
CREATE PROCEDURE InsertarPersona(
    IN p_id_persona INT,
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_fecha_nacimiento DATE,
    IN p_sexo VARCHAR(10),
    IN p_dni VARCHAR(20)
)
BEGIN
    INSERT INTO Persona (id_persona, nombre, apellido, fecha_nacimiento, sexo, dni)
    VALUES (p_id_persona, p_nombre, p_apellido, p_fecha_nacimiento, p_sexo, p_dni);
END //

-- Procedimiento para insertar en la tabla Contacto
CREATE PROCEDURE InsertarContacto(
    IN p_id_contacto INT,
    IN p_tipo_contacto VARCHAR(50),
    IN p_valor VARCHAR(255),
    IN p_id_persona INT
)
BEGIN
    INSERT INTO Contacto (id_contacto, tipo_contacto, valor, id_persona)
    VALUES (p_id_contacto, p_tipo_contacto, p_valor, p_id_persona);
END //

-- Procedimiento para insertar en la tabla Direcciones
CREATE PROCEDURE InsertarDireccion(
    IN p_id_direccion INT,
    IN p_calle VARCHAR(255),
    IN p_numero VARCHAR(20),
    IN p_ciudad VARCHAR(100),
    IN p_id_persona INT
)
BEGIN
    INSERT INTO Direcciones (id_direccion, calle, numero, ciudad, id_persona)
    VALUES (p_id_direccion, p_calle, p_numero, p_ciudad, p_id_persona);
END //

-- Procedimiento para insertar en la tabla Personal_administrativo
CREATE PROCEDURE InsertarPersonalAdministrativo(
    IN p_id_personal_administrativo VARCHAR(20),
    IN p_cargo VARCHAR(100),
    IN p_departamento VARCHAR(100),
    IN p_id_persona INT
)
BEGIN
    INSERT INTO Personal_administrativo (id_personal_administrativo, cargo, departamento, id_persona)
    VALUES (p_id_personal_administrativo, p_cargo, p_departamento, p_id_persona);
END //

-- Procedimiento para insertar en la tabla Medico
CREATE PROCEDURE InsertarMedico(
    IN p_id_medico INT,
    IN p_numero_colegiado INT,
    IN p_id_persona INT
)
BEGIN
    INSERT INTO Medico (id_medico, numero_colegiado, id_persona)
    VALUES (p_id_medico, p_numero_colegiado, p_id_persona);
END //

-- Procedimiento para insertar en la tabla Especialidad
CREATE PROCEDURE InsertarEspecialidad(
    IN p_id_especialidad INT,
    IN p_nombre VARCHAR(100)
)
BEGIN
    INSERT INTO Especialidad (id_especialidad, nombre)
    VALUES (p_id_especialidad, p_nombre);
END //

-- Procedimiento para insertar en la tabla Paciente
CREATE PROCEDURE InsertarPaciente(
    IN p_id_paciente INT,
    IN p_grupo_sanguineo VARCHAR(5),
    IN p_id_persona INT
)
BEGIN
    INSERT INTO Paciente (id_paciente, grupo_sanguineo, id_persona)
    VALUES (p_id_paciente, p_grupo_sanguineo, p_id_persona);
END //

-- Procedimiento para insertar en la tabla Citas
CREATE PROCEDURE InsertarCita(
    IN p_id_cita INT,
    IN p_fecha_hora DATETIME,
    IN p_estado VARCHAR(50),
    IN p_id_medico INT,
    IN p_id_paciente INT
)
BEGIN
    INSERT INTO Citas (id_cita, fecha_hora, estado, id_medico, id_paciente)
    VALUES (p_id_cita, p_fecha_hora, p_estado, p_id_medico, p_id_paciente);
END //

-- Procedimiento para insertar en la tabla Consultas
CREATE PROCEDURE InsertarConsulta(
    IN p_id_consulta INT,
    IN p_diagnostico TEXT,
    IN p_id_cita INT
)
BEGIN
    INSERT INTO Consultas (id_consulta, diagnostico, id_cita)
    VALUES (p_id_consulta, p_diagnostico, p_id_cita);
END //

-- Procedimiento para insertar en la tabla Tratamiento
CREATE PROCEDURE InsertarTratamiento(
    IN p_id_tratamiento INT,
    IN p_descripcion TEXT,
    IN p_id_consulta INT
)
BEGIN
    INSERT INTO Tratamiento (id_tratamiento, descripcion, id_consulta)
    VALUES (p_id_tratamiento, p_descripcion, p_id_consulta);
END //

-- Procedimiento para insertar en la tabla Hospitalizacion
CREATE PROCEDURE InsertarHospitalizacion(
    IN p_id_hospitalizacion INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_final DATE,
    IN p_id_paciente INT
)
BEGIN
    INSERT INTO Hospitalizacion (id_hospitalizacion, fecha_inicio, fecha_final, id_paciente)
    VALUES (p_id_hospitalizacion, p_fecha_inicio, p_fecha_final, p_id_paciente);
END //

-- Procedimiento para insertar en la tabla Habitaciones
CREATE PROCEDURE InsertarHabitacion(
    IN p_numero INT,
    IN p_tipo VARCHAR(50),
    IN p_estado VARCHAR(50)
)
BEGIN
    INSERT INTO Habitaciones (numero, tipo, estado)
    VALUES (p_numero, p_tipo, p_estado);
END //

-- Procedimiento para insertar en la tabla Cirugias
CREATE PROCEDURE InsertarCirugia(
    IN p_id_cirugia INT,
    IN p_numero_quirofano INT,
    IN p_fecha_hora DATETIME,
    IN p_tipo_procedimiento VARCHAR(255),
    IN p_id_paciente INT
)
BEGIN
    INSERT INTO Cirugias (id_cirugia, numero_quirofano, fecha_hora, tipo_procedimiento, id_paciente)
    VALUES (p_id_cirugia, p_numero_quirofano, p_fecha_hora, p_tipo_procedimiento, p_id_paciente);
END //

-- Procedimiento para insertar en la tabla Medicamentos
CREATE PROCEDURE InsertarMedicamento(
    IN p_codigo_medicamento INT,
    IN p_nombre VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_stock INT
)
BEGIN
    INSERT INTO Medicamentos (codigo_medicamento, nombre, descripcion, stock)
    VALUES (p_codigo_medicamento, p_nombre, p_descripcion, p_stock);
END //

-- Procedimiento para insertar en la tabla Prescripciones
CREATE PROCEDURE InsertarPrescripcion(
    IN p_numero_factura INT,
    IN p_fecha DATE,
    IN p_monto_total DECIMAL(10, 2),
    IN p_estado VARCHAR(50),
    IN p_id_paciente INT
)
BEGIN
    INSERT INTO Prescripciones (numero_factura, fecha, monto_total, estado, id_paciente)
    VALUES (p_numero_factura, p_fecha, p_monto_total, p_estado, p_id_paciente);
END //

-- Procedimiento para insertar en la tabla Detalles_factura
CREATE PROCEDURE InsertarDetalleFactura(
    IN p_id_detalle INT,
    IN p_descripcion VARCHAR(255),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10, 2),
    IN p_numero_factura INT
)
BEGIN
    INSERT INTO Detalles_factura (id_detalle, descripcion, cantidad, precio_unitario, numero_factura)
    VALUES (p_id_detalle, p_descripcion, p_cantidad, p_precio_unitario, p_numero_factura);
END //

DELIMITER ;

-- Insertar en la tabla Persona
CALL InsertarPersona(1, 'Juan', 'Pérez', '1990-01-01', 'Masculino', '12345678');

-- Insertar en la tabla Contacto
CALL InsertarContacto(1, 'Teléfono', '123-456-7890', 1);

-- Insertar en la tabla Direcciones
CALL InsertarDireccion(1, 'Calle Principal', '123', 'Ciudad A', 1);

-- Insertar en la tabla Personal_administrativo
CALL InsertarPersonalAdministrativo('ADM001', 'Gerente', 'Administración', 1);

-- Insertar en la tabla Medico
CALL InsertarMedico(1, 12345, 1);

-- Insertar en la tabla Especialidad
CALL InsertarEspecialidad(1, 'Cardiología');

-- Insertar en la tabla Paciente
CALL InsertarPaciente(1, 'A+', 1);

-- Insertar en la tabla Citas
CALL InsertarCita(1, '2024-08-28 10:00:00', 'Programada', 1, 1);

-- Insertar en la tabla Consultas
CALL InsertarConsulta(1, 'Diagnóstico inicial', 1);

-- Insertar en la tabla Tratamiento
CALL InsertarTratamiento(1, 'Tratamiento prescrito', 1);

-- Insertar en la tabla Hospitalizacion
CALL InsertarHospitalizacion(1, '2024-08-29', '2024-09-05', 1);

-- Insertar en la tabla Habitaciones
CALL InsertarHabitacion(101, 'Individual', 'Disponible');

-- Insertar en la tabla Cirugias
CALL InsertarCirugia(1, 3, '2024-08-30 09:00:00', 'Cirugía cardíaca', 1);

-- Insertar en la tabla Medicamentos
CALL InsertarMedicamento(1001, 'Paracetamol', 'Analgésico y antipirético', 1000);

-- Insertar en la tabla Prescripciones
CALL InsertarPrescripcion(1, '2024-08-28', 150.00, 'Pagada', 1);

-- Insertar en la tabla Detalles_factura
CALL InsertarDetalleFactura(1, 'Consulta médica', 1, 150.00, 1);

-- funciones 
-- Cambia el delimitador para crear funciones
DELIMITER $$

-- Función para editar la tabla Persona
CREATE FUNCTION EditarPersona(
    p_id_persona INT,
    p_nombre VARCHAR(255),
    p_apellido VARCHAR(255),
    p_fecha_nacimiento DATE,
    p_sexo VARCHAR(10),
    p_dni VARCHAR(20)
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Persona
    SET nombre = p_nombre,
        apellido = p_apellido,
        fecha_nacimiento = p_fecha_nacimiento,
        sexo = p_sexo,
        dni = p_dni
    WHERE id_persona = p_id_persona;
    
    RETURN CONCAT('Persona con ID ', p_id_persona, ' actualizada.');
END $$

-- Función para editar la tabla Contacto
CREATE FUNCTION EditarContacto(
    p_id_contacto INT,
    p_tipo_contacto VARCHAR(50),
    p_valor VARCHAR(255),
    p_id_persona INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Contacto
    SET tipo_contacto = p_tipo_contacto,
        valor = p_valor,
        id_persona = p_id_persona
    WHERE id_contacto = p_id_contacto;
    
    RETURN CONCAT('Contacto con ID ', p_id_contacto, ' actualizado.');
END $$

-- Función para editar la tabla Direcciones
CREATE FUNCTION EditarDirecciones(
    p_id_direccion INT,
    p_calle VARCHAR(255),
    p_numero VARCHAR(20),
    p_ciudad VARCHAR(100),
    p_id_persona INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Direcciones
    SET calle = p_calle,
        numero = p_numero,
        ciudad = p_ciudad,
        id_persona = p_id_persona
    WHERE id_direccion = p_id_direccion;
    
    RETURN CONCAT('Dirección con ID ', p_id_direccion, ' actualizada.');
END $$

-- Función para editar la tabla Personal_administrativo
CREATE FUNCTION EditarPersonalAdministrativo(
    p_id_personal_administrativo VARCHAR(20),
    p_cargo VARCHAR(100),
    p_departamento VARCHAR(100),
    p_id_persona INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Personal_administrativo
    SET cargo = p_cargo,
        departamento = p_departamento,
        id_persona = p_id_persona
    WHERE id_personal_administrativo = p_id_personal_administrativo;
    
    RETURN CONCAT('Personal Administrativo con ID ', p_id_personal_administrativo, ' actualizado.');
END $$

-- Función para editar la tabla Medico
CREATE FUNCTION EditarMedico(
    p_id_medico INT,
    p_numero_colegiado INT,
    p_id_persona INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Medico
    SET numero_colegiado = p_numero_colegiado,
        id_persona = p_id_persona
    WHERE id_medico = p_id_medico;
    
    RETURN CONCAT('Médico con ID ', p_id_medico, ' actualizado.');
END $$

-- Función para editar la tabla Especialidad
CREATE FUNCTION EditarEspecialidad(
    p_id_especialidad INT,
    p_nombre VARCHAR(100)
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Especialidad
    SET nombre = p_nombre
    WHERE id_especialidad = p_id_especialidad;
    
    RETURN CONCAT('Especialidad con ID ', p_id_especialidad, ' actualizada.');
END $$

-- Función para editar la tabla Paciente
CREATE FUNCTION EditarPaciente(
    p_id_paciente INT,
    p_grupo_sanguineo VARCHAR(5),
    p_id_persona INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Paciente
    SET grupo_sanguineo = p_grupo_sanguineo,
        id_persona = p_id_persona
    WHERE id_paciente = p_id_paciente;
    
    RETURN CONCAT('Paciente con ID ', p_id_paciente, ' actualizado.');
END $$

-- Función para editar la tabla Citas
CREATE FUNCTION EditarCitas(
    p_id_cita INT,
    p_fecha_hora DATETIME,
    p_estado VARCHAR(50),
    p_id_medico INT,
    p_id_paciente INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Citas
    SET fecha_hora = p_fecha_hora,
        estado = p_estado,
        id_medico = p_id_medico,
        id_paciente = p_id_paciente
    WHERE id_cita = p_id_cita;
    
    RETURN CONCAT('Cita con ID ', p_id_cita, ' actualizada.');
END $$

-- Función para editar la tabla Consultas
CREATE FUNCTION EditarConsultas(
    p_id_consulta INT,
    p_diagnostico TEXT,
    p_id_cita INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Consultas
    SET diagnostico = p_diagnostico,
        id_cita = p_id_cita
    WHERE id_consulta = p_id_consulta;
    
    RETURN CONCAT('Consulta con ID ', p_id_consulta, ' actualizada.');
END $$

-- Función para editar la tabla Tratamiento
CREATE FUNCTION EditarTratamiento(
    p_id_tratamiento INT,
    p_descripcion TEXT,
    p_id_consulta INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Tratamiento
    SET descripcion = p_descripcion,
        id_consulta = p_id_consulta
    WHERE id_tratamiento = p_id_tratamiento;
    
    RETURN CONCAT('Tratamiento con ID ', p_id_tratamiento, ' actualizado.');
END $$

-- Función para editar la tabla Hospitalizacion
CREATE FUNCTION EditarHospitalizacion(
    p_id_hospitalizacion INT,
    p_fecha_inicio DATE,
    p_fecha_final DATE,
    p_id_paciente INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Hospitalizacion
    SET fecha_inicio = p_fecha_inicio,
        fecha_final = p_fecha_final,
        id_paciente = p_id_paciente
    WHERE id_hospitalizacion = p_id_hospitalizacion;
    
    RETURN CONCAT('Hospitalización con ID ', p_id_hospitalizacion, ' actualizada.');
END $$

-- Función para editar la tabla Habitaciones
CREATE FUNCTION EditarHabitaciones(
    p_numero INT,
    p_tipo VARCHAR(50),
    p_estado VARCHAR(50)
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Habitaciones
    SET tipo = p_tipo,
        estado = p_estado
    WHERE numero = p_numero;
    
    RETURN CONCAT('Habitación con número ', p_numero, ' actualizada.');
END $$

-- Función para editar la tabla Cirugias
CREATE FUNCTION EditarCirugias(
    p_id_cirugia INT,
    p_numero_quirofano INT,
    p_fecha_hora DATETIME,
    p_tipo_procedimiento VARCHAR(255),
    p_id_paciente INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Cirugias
    SET numero_quirofano = p_numero_quirofano,
        fecha_hora = p_fecha_hora,
        tipo_procedimiento = p_tipo_procedimiento,
        id_paciente = p_id_paciente
    WHERE id_cirugia = p_id_cirugia;
    
    RETURN CONCAT('Cirugía con ID ', p_id_cirugia, ' actualizada.');
END $$

-- Función para editar la tabla Medicamentos
CREATE FUNCTION EditarMedicamentos(
    p_codigo_medicamento INT,
    p_nombre VARCHAR(255),
    p_descripcion TEXT,
    p_stock INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Medicamentos
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        stock = p_stock
    WHERE codigo_medicamento = p_codigo_medicamento;
    
    RETURN CONCAT('Medicamento con código ', p_codigo_medicamento, ' actualizado.');
END $$

-- Función para editar la tabla Prescripciones
CREATE FUNCTION EditarPrescripciones(
    p_numero_factura INT,
    p_fecha DATE,
    p_monto_total DECIMAL(10, 2),
    p_estado VARCHAR(50),
    p_id_paciente INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Prescripciones
    SET fecha = p_fecha,
        monto_total = p_monto_total,
        estado = p_estado,
        id_paciente = p_id_paciente
    WHERE numero_factura = p_numero_factura;
    
    RETURN CONCAT('Prescripción con número de factura ', p_numero_factura, ' actualizada.');
END $$

-- Función para editar la tabla Detalles_factura
CREATE FUNCTION EditarDetallesFactura(
    p_id_detalle INT,
    p_descripcion VARCHAR(255),
    p_cantidad INT,
    p_precio_unitario DECIMAL(10, 2),
    p_numero_factura INT
) RETURNS VARCHAR(255)
BEGIN
    UPDATE Detalles_factura
    SET descripcion = p_descripcion,
        cantidad = p_cantidad,
        precio_unitario = p_precio_unitario,
        numero_factura = p_numero_factura
    WHERE id_detalle = p_id_detalle;
    
    RETURN CONCAT('Detalle de factura con ID ', p_id_detalle, ' actualizado.');
END $$

-- Restaura el delimitador
DELIMITER ;

SELECT EditarPersona(1, 'pedro', 'Pérez', '1990-01-01', 'M', '12345678A');

-- triggers
DELIMITER //

CREATE TRIGGER before_insert_persona
BEFORE INSERT ON Persona
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Persona
    SET NEW.nombre = UPPER(NEW.nombre);
END;
//

CREATE TRIGGER before_insert_contacto
BEFORE INSERT ON Contacto
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Contacto
    SET NEW.tipo_contacto = UPPER(NEW.tipo_contacto);
END;
//

CREATE TRIGGER before_insert_direcciones
BEFORE INSERT ON Direcciones
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Direcciones
    SET NEW.calle = UPPER(NEW.calle);
END;
//

CREATE TRIGGER before_insert_personal_administrativo
BEFORE INSERT ON Personal_administrativo
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Personal_administrativo
    SET NEW.cargo = UPPER(NEW.cargo);
END;
//

CREATE TRIGGER before_insert_medico
BEFORE INSERT ON Medico
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Medico
    SET NEW.numero_colegiado = NEW.numero_colegiado;
END;
//

CREATE TRIGGER before_insert_especialidad
BEFORE INSERT ON Especialidad
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Especialidad
    SET NEW.nombre = UPPER(NEW.nombre);
END;
//

CREATE TRIGGER before_insert_paciente
BEFORE INSERT ON Paciente
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Paciente
    SET NEW.grupo_sanguineo = UPPER(NEW.grupo_sanguineo);
END;
//

CREATE TRIGGER before_insert_citas
BEFORE INSERT ON Citas
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Citas
    SET NEW.estado = UPPER(NEW.estado);
END;
//

CREATE TRIGGER before_insert_consultas
BEFORE INSERT ON Consultas
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Consultas
    SET NEW.diagnostico = UPPER(NEW.diagnostico);
END;
//

CREATE TRIGGER before_insert_tratamiento
BEFORE INSERT ON Tratamiento
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Tratamiento
    SET NEW.descripcion = UPPER(NEW.descripcion);
END;
//

CREATE TRIGGER before_insert_hospitalizacion
BEFORE INSERT ON Hospitalizacion
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Hospitalizacion
    SET NEW.id_paciente = NEW.id_paciente;
END;
//

CREATE TRIGGER before_insert_habitaciones
BEFORE INSERT ON Habitaciones
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Habitaciones
    SET NEW.tipo = UPPER(NEW.tipo);
END;
//

CREATE TRIGGER before_insert_cirugias
BEFORE INSERT ON Cirugias
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Cirugias
    SET NEW.tipo_procedimiento = UPPER(NEW.tipo_procedimiento);
END;
//

CREATE TRIGGER before_insert_medicamentos
BEFORE INSERT ON Medicamentos
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Medicamentos
    SET NEW.nombre = UPPER(NEW.nombre);
END;
//

CREATE TRIGGER before_insert_prescripciones
BEFORE INSERT ON Prescripciones
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Prescripciones
    SET NEW.estado = UPPER(NEW.estado);
END;
//

CREATE TRIGGER before_insert_detalles_factura
BEFORE INSERT ON Detalles_factura
FOR EACH ROW
BEGIN
    -- Acciones que quieres realizar antes de insertar en Detalles_factura
    SET NEW.descripcion = UPPER(NEW.descripcion);
END;
//

DELIMITER ;

INSERT INTO Persona (id_persona, nombre, apellido, fecha_nacimiento, sexo, dni)
VALUES (3, 'pablo', 'perez', '1990-05-10', 'Masculino', '12345678');

SELECT * FROM Persona WHERE id_persona = 3;
