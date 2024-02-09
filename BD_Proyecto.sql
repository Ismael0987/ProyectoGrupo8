-- Tabla de Usuarios
CREATE TABLE Usuarios (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(20),
    correo_electronico VARCHAR(70),
    contrasena VARCHAR(30)
);

-- Tabla de Productos
CREATE TABLE Productos (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100),
    marca VARCHAR(30),
    precio DECIMAL (10, 2),
    descripcion TEXT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

-- Tabla de Categorias
CREATE TABLE Categorias (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(50)
);

-- Tabla de Carrito de Compra
CREATE TABLE Carrito_Compra (
    id INT PRIMARY KEY IDENTITY,
    usuario_id INT,
    producto_id INT,
    cantidad INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- Tabla de Pedidos
CREATE TABLE Pedidos (
    id INT PRIMARY KEY IDENTITY,
    usuario_id INT,
    total DECIMAL(10, 2),
    fecha DATETIME DEFAULT GETDATE(),
    direccion_envio VARCHAR(300),
    metodo_pago VARCHAR(30),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
