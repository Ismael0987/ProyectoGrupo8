
CREATE DATABASE BaseDatosPgraAvanzada;
GO

USE BaseDatosPgraAvanzada;
GO

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(20),
    correo_electronico VARCHAR(70),
    contrasena VARCHAR(30)
);

-- Tabla de Categorias
CREATE TABLE Categorias (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(50)
);

-- Tabla de Productos
CREATE TABLE Productos (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100),
    marca VARCHAR(30),
    precio DECIMAL(10, 2),
    descripcion TEXT,
    categoria_id INT,
    imagen_url VARCHAR(500),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
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

-- Insertar datos de muestra en la tabla de Categorias
INSERT INTO Categorias (nombre) VALUES 
('Hombre'),
('Mujer'),
('Unisex');

-- Insertar datos de muestra en la tabla de Usuarios
INSERT INTO Usuarios (nombre, correo_electronico, contrasena) VALUES
('Silvanna', 'silvanna1@gmail.com', '12345'),
('Ismael', 'ismael@gmail.com', '56789');

-- Insertar datos de muestra en la tabla de Productos
INSERT INTO Productos (nombre, marca, precio, descripcion, categoria_id, imagen_url)
VALUES 
('Rolex Submariner', 'Rolex', 12000.00, 'Reloj de buceo de lujo con movimiento automático', 1, 'https://cdn2.jomashop.com/media/catalog/product/r/o/rolex-oyster-perpetual-submariner-black-dial-black-cerachrom-bezel-automatic-men_s-watch-116610ln.jpg'),
('Cartier Tank', 'Cartier', 8000.00, 'Reloj de vestir icónico con caja de oro', 2, 'https://www.cartier.com/content/dam/rcq/car/34/28/24/342824.jpg.transform.hero-product-large.jpg'),
('Omega Speedmaster', 'Omega', 6000.00, 'Reloj cronógrafo legendario usado en la misión Apollo', 3, 'https://www.omegawatches.com/media/catalog/product/cache/4a89cb66278aa7c0153f2e7859176c20/3/1/31032425001001_hero.jpg'),
('Patek Philippe Nautilus', 'Patek Philippe', 35000.00, 'Reloj deportivo de lujo con caja de acero inoxidable y brazalete integrado', 1, 'https://cdn2.jomashop.com/media/catalog/product/cache/1688b0886e5bc06448cdcc1c0088d27d/p/a/patek-philippe-nautilus-blue-dial-mens-steel-watch-5711-1a-010_2.jpg'),
('Audemars Piguet Royal Oak', 'Audemars Piguet', 42000.00, 'Reloj deportivo de lujo con caja octogonal de acero y brazalete de eslabones', 1, 'https://gandgtimepieces.com/cdn/shop/products/DSC_7336-X4.jpg?v=1675358602'),
('Hublot Big Bang', 'Hublot', 25000.00, 'Reloj cronógrafo de lujo con caja de cerámica y esfera esqueleto', 1, 'https://www.hublot.com/sites/default/files/styles/global_laptop_1x/public/2022-06/big-bang-unico-essential-grey-42-mm-lifestyle-shot-4.jpg?itok=cYk0xGDR'),
('Chopard Happy Diamonds', 'Chopard', 18000.00, 'Reloj femenino con diamantes móviles en la esfera y correa de cuero', 2, 'https://objects-prod.cdn.chopard.com/ar_1:1,c_pad,w_600,b_white,f_auto,q_auto,dpr_auto/ProductsAssets/Web/278610-3001_01.png'),
('Cartier Ballon Bleu', 'Cartier', 21000.00, 'Reloj femenino con esfera con forma de globo y corona decorativa con un zafiro azul', 2, 'https://www.cartier.com/dw/image/v2/BGTJ_PRD/on/demandware.static/-/Sites-cartier-master/default/dwaa9e95e0/images/large/e4d3cab83d375b0a890932933e090eba.png?sw=750&sh=750&sm=fit&sfrm=png'),
('Bulgari Serpenti', 'Bulgari', 32000.00, 'Reloj femenino con esfera en forma de cabeza de serpiente y brazalete flexible', 2, 'https://media2.bulgari.com/image/upload/f_auto,q_auto/v1686321492/collection/Serpenti/2023/640x640-lapide-jp_siylqm.jpg'),
('TAG Heuer Carrera', 'TAG Heuer', 5500.00, 'Reloj cronógrafo unisex con esfera negra y correa de acero inoxidable', 3, 'https://eurochronoscr.com/wp-content/uploads/2022/01/main_19013.jpg'),
('Movado Museum Classic', 'Movado', 1200.00, 'Reloj minimalista unisex con esfera negra y correa de cuero', 3, 'https://eurochronoscr.com/wp-content/uploads/2020/11/main_10700.jpg'),
('Longines Master Collection', 'Longines', 3800.00, 'Reloj clásico unisex con esfera plateada y correa de acero inoxidable', 3, 'https://api.ecom.longines.com/media/catalog/product/w/a/watch-collection-longines-master-collection-l2-773-4-61-2-1702596680.png'),
('Rolex Datejust', 'Rolex', 15000.00, 'Reloj clásico de lujo con movimiento automático y calendario', 1, 'https://joyeriarose.com/wp-content/uploads/2023/05/m126334-0032_collection_upright_landscape.jpg'),
('Jaeger-LeCoultre Reverso', 'Jaeger-LeCoultre', 8500.00, 'Reloj de lujo con caja reversible y complicaciones mecánicas', 1, 'https://cdn.thewatchpages.com/app/uploads/2021/04/13203347/jaeger-lecoultre-reverso-hybris-mechanica-calibre-185-q7103420-7.jpg'),
('Audemars Piguet Royal Oak Offshore', 'Audemars Piguet', 48000.00, 'Reloj deportivo de lujo con cronógrafo y caja de titanio', 1, 'https://theswisscollector.com/22433/audemars-piguet-royal-oak-offshore.jpg'),
('Cartier Santos', 'Cartier', 9000.00, 'Reloj de lujo con diseño geométrico y corona de zafiro', 2, 'https://www.watchaser.com/cdn/shop/files/CartierSantos-DumontXLSteel_RoseGoldW2SA0011_grande.jpg?v=1691350408'),
('Chanel J12', 'Chanel', 6500.00, 'Reloj de cerámica de alta tecnología con bisel giratorio y movimiento automático', 2, 'https://www.chanel.com/images//t_one///q_auto:good,f_auto,fl_lossy,dpr_1.1/w_1920/j12-diamond-bezel-watch-caliber-12-1-38-mm-black-black-ceramic-steel-diamond-packshot-default-h6526-9527970267166.jpg'),
('Piaget Altiplano', 'Piaget', 18000.00, 'Reloj ultradelgado de lujo con esfera plateada y movimiento mecánico', 2, 'https://hodinkee-production.s3.amazonaws.com/uploads/images/1587765090151-v0xea0w4ec-fa708e331d75f2cb698363de80f3e806/white-dial-blue-subdial'),
('Panerai Luminor', 'Panerai', 7000.00, 'Reloj de buceo de lujo con correa de cuero y corona protectora', 3, 'https://www.panerai.com/content/dam/rcq/pan/23/03/49/2/2303492.png'),
('IWC Portugieser', 'IWC', 8200.00, 'Reloj de lujo con esfera azul y complicaciones de fecha y fase lunar', 3, 'https://boutique.heathrow.com/dw/image/v2/BDNX_PRD/on/demandware.static/-/Sites-boutique-master-catalog/default/dw41a2d3fa/images/hi-res/watches-of-switzerland/17810701detailImage01.jpg'),
('Breitling Navitimer', 'Breitling', 7500.00, 'Reloj cronógrafo de lujo con regla de cálculo de aviación y correa de acero', 3, 'https://www.breitling.com/media/image/2/cfg_site/asset-version-810fee6192/ab0137211c1p1-navitimer-b01-chronograph-46-soldier.png'),
('Hublot Classic Fusion', 'Hublot', 13500.00, 'Reloj de lujo con esfera esqueleto y correa de caucho', 3, 'https://www.hublot.com/sites/default/files/styles/watch_item_desktop_1x_scale_no_crop_600_6000_/public/2020-06/Classic-Fusion-Titanium-on-Rubber-42-mm_0.png?itok=AhYROabB'),
('Audemars Piguet Royal Oak Concept', 'Audemars Piguet', 85000.00, 'Reloj de lujo con caja de cerámica y tourbillon volante', 1, 'https://www.europeanwatch.com/blog/hero-audemars-piguet-royal-oak-concept-flying-tourbillon-gmt-26589io-oo-d002ca-01/'),
('Patek Philippe Grand Complications', 'Patek Philippe', 180000.00, 'Reloj de lujo con complicaciones de calendario perpetuo y cronógrafo', 1, 'https://www.thehourglass.com/au/wp-content/uploads/sites/18/2020/07/5270J_001_1.jpg'),
('Rolex Day-Date', 'Rolex', 32000.00, 'Reloj clásico de lujo con calendario completo y día de la semana en varios idiomas', 1, 'https://static.wixstatic.com/media/aa10f6_9aea0f3b84504245bc3e92115960bc90~mv2.jpg/v1/fill/w_640,h_480,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/aa10f6_9aea0f3b84504245bc3e92115960bc90~mv2.jpg'),
('Chopard Mille Miglia', 'Chopard', 9000.00, 'Reloj deportivo de lujo con diseño inspirado en la carrera Mille Miglia', 2, 'https://objects-prod.cdn.chopard.com/ar_1:1,c_pad,w_600,b_white,f_auto,q_auto,dpr_auto/ProductsAssets/Web/168619-3001_01.png'),
('Rolex Lady Datejust', 'Rolex', 14000.00, 'Reloj clásico de lujo para mujer con movimiento automático y calendario', 2, 'https://joyeriarose.com/wp-content/uploads/2022/06/m279160-0013_modelpage_front_facing_landscape.png'),
('Cartier Panthère', 'Cartier', 11500.00, 'Reloj de lujo con diseño de pantera y correa de acero', 2, 'https://www.cartier.com/variants/images/44733502651435010/img1/w960.jpg'),
('Omega Seamaster', 'Omega', 6500.00, 'Reloj de buceo de lujo con bisel giratorio y correa de caucho', 3, 'https://www.watchaser.com/cdn/shop/files/omega-seamaster-diver-300m-21030422003001-l_800x.png?v=1688767296'),
('Breitling Superocean', 'Breitling', 5800.00, 'Reloj de buceo de lujo con esfera negra y correa de acero', 3, 'https://cdn1.ethoswatches.com/media/catalog/product/cache/6e5de5bc3d185d8179cdc7258143f41a/b/r/breitling-ub2030121b1a1-multiple-1.jpg'),
('Tudor Black Bay', 'Tudor', 4000.00, 'Reloj de buceo de lujo con esfera negra y correa de tela', 3, 'https://shop.casabarros.cl/cdn/shop/files/M7941A1A0RU-0003_4.jpg?v=1687265372'),
('IWC Pilot', 'IWC', 7200.00, 'Reloj de piloto de lujo con esfera negra y correa de cuero', 3, 'https://www.iwc.com/content/dam/rcq/iwc/21/49/95/2/2149952.png.transform.global_image_480_2x.png'),
('Breguet Classique', 'Breguet', 28000.00, 'Reloj de lujo con esfera guilloché y movimiento automático', 1, 'https://www.breguet.com/sites/default/files/gardetemps/variante/soldat/5157_0.jpg'),
('Ulysse Nardin Freak', 'Ulysse Nardin', 62000.00, 'Reloj de lujo con tourbillon carrousel y movimiento manual', 1, 'https://revolutionwatch.com/cdn-cgi/image/width=2560,height=1708,fit=crop,quality=80,format=auto,onerror=redirect,metadata=none/wp-content/uploads/2023/04/Freak-One-2023-04-scaled-1.jpg'),
('Vacheron Constantin Overseas', 'Vacheron Constantin', 42000.00, 'Reloj de lujo deportivo con movimiento automático y calendario', 1, 'https://www.vacheron-constantin.com/dam/vac/watches-wonders/2023/VAC_WW23_OVS_carousel_desktop_5.png.transform.vacfw.jpeg'),
('Panerai Radiomir', 'Panerai', 9600.00, 'Reloj de lujo con esfera sandwich y correa de cuero vintage', 2, 'https://www.panerai.com/content/dam/rcq/pan/23/03/50/4/2303504.png.transform.global_square_image_559_2x.png'),
('Piaget Polo', 'Piaget', 21000.00, 'Reloj deportivo de lujo con caja de oro y movimiento automático', 2, 'https://www.analogshift.com/cdn/shop/files/AS09278_40991748_PIAGET_POLO18KYGDAYDATEQUARTZ_15562C701-6.jpg?v=1700242457&width=1445'),
('Bvlgari Octo', 'Bvlgari', 19500.00, 'Reloj de lujo con esfera esqueleto y correa de cuero de cocodrilo', 2, 'https://monochrome-watches.com/wp-content/uploads/2023/04/Bulgari-Octo-Finissimo-Skeleton-8-Days-Titanium-7.jpg'),
('Blancpain Fifty Fathoms', 'Blancpain', 16800.00, 'Reloj de buceo de lujo con bisel de cerámica y correa de tela', 3, 'https://hips.hearstapps.com/hmg-prod/images/index-139-1672946124.jpg?crop=0.500xw:1.00xh;0,0&resize=1200:*'),
('Chopard L.U.C', 'Chopard', 32000.00, 'Reloj de lujo con movimiento automático y fase lunar', 3, 'https://cms.gphg.org/uploads/gphg2023_L_U_C1860_v2_001_583d17f066.jpg'),
('Hermès Arceau', 'Hermès', 12500.00, 'Reloj de lujo con diseño de esfera en forma de herradura y correa de cuero', 3, 'https://assets.hermes.com/is/image/hermesproduct/arceau-watch-40mm--055378WW00-front-1-300-0-800-800_g.jpg'),
('Zenith Defy', 'Zenith', 17500.00, 'Reloj de lujo con esfera esqueleto y correa de caucho', 3, 'https://www.thehourglass.com/wp-content/uploads/sites/15/2023/03/03.9300.3620.51.I001-1-1.png'),
('Richard Mille RM 011', 'Richard Mille', 185000.00, 'Reloj de lujo con cronógrafo y esqueleto de movimiento automático', 1, 'https://gandgtimepieces.com/cdn/shop/products/DSC_5122-X4.jpg?v=1678893241&width=2048'),
('Audemars Piguet Code 11.59', 'Audemars Piguet', 55000.00, 'Reloj de lujo con caja de oro blanco y movimiento automático', 1, 'https://www.audemarspiguet.com/content/dam/ap/com/novelties/code-1159-selfwinding-chronograph-/1920x1676_v8.jpg.transform.apfw.jpg'),
('Patek Philippe Calatrava', 'Patek Philippe', 26000.00, 'Reloj de lujo clásico con movimiento automático y esfera blanca', 1, 'https://www.thehourglass.com/my/wp-content/uploads/sites/19/2021/04/6119R-001.png'),
('Girard-Perregaux Laureato', 'Girard-Perregaux', 17500.00, 'Reloj de lujo deportivo con esfera azul y correa de acero', 2, 'https://monochrome-watches.com/wp-content/uploads/2022/09/Girard-Perregaux-Laureato-42mm-Green-Dial-1.jpg'),
('Jaquet Droz Grande Seconde', 'Jaquet Droz', 34000.00, 'Reloj de lujo con esfera de esmalte y segundos descentrados', 2, 'https://www.jaquet-droz.com/sites/default/files/styles/page_collection_h350/public/J011033202_GRANDE-SECONDE-MINUTE-REPEATER_0.jpg?itok=iDnVHqZS'),
('Franck Muller Vanguard', 'Franck Muller', 21500.00, 'Reloj de lujo con caja tonneau y movimiento automático', 2, 'https://watchexchange.sg/wp-content/uploads/2023/07/franck-muller-vanguard-review-1024x672.jpg'),
('Seiko Prospex', 'Seiko', 4200.00, 'Reloj de buceo profesional con bisel giratorio y correa de silicona', 3, 'https://www.seikowatches.com/latin-es/-/media/HtmlUploader/Latin/Seiko/Home/products/prospex/special/1965_6L/asset/img/main_x15.jpg'),
('Citizen Promaster', 'Citizen', 3200.00, 'Reloj de buceo con movimiento Eco-Drive y resistencia al agua hasta 200 metros', 3, 'https://m.media-amazon.com/images/I/711Ptw4HSAS._AC_SL1500_.jpg'),
('Oris Divers Sixty-Five', 'Oris', 2900.00, 'Reloj de buceo vintage con bisel de cerámica y correa de tela', 3, 'https://media.gq.com.mx/photos/650b2d8b4d4aaf540afe0bb6/16:9/w_2560%2Cc_limit/Oris_Divers%2520Sixty-Five%2520Chronograph.jpg'),
('Tissot Seastar', 'Tissot', 2500.00, 'Reloj de buceo profesional con bisel unidireccional y correa de acero inoxidable', 3, 'https://www.tissotwatches.com/media/catalog/product/T/1/T120.607.11.041.00_AMB_S_1_1.jpg');

