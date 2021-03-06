USE [PGMClipActas]
GO
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (1, N'Documentacion')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (2, N'Licencia de Conductor')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (3, N'Vehiculos en General')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (4, N'Semaforos')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (10, N'Alcoholemia')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (20, N'Circulación')
INSERT [dbo].[Grupos_Infracciones] ([codigo_grupo], [grupo]) VALUES (30, N'Transporte Escolar')
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 

INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (1, 77, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (2, 58, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (3, 90, N'a')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (4, 41, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (5, 41, N'b')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (6, 111, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (7, 84, N'14')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (8, 43, N'1.f')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (9, 39, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (10, 31, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (11, 56, N'2')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (12, 54, N'a.8')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (13, 43, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (14, 47, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (15, 74, N'3')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (16, 74, N'1.b')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (17, 42, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (18, 48, N'5')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (19, 49, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (20, 90, N'c')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (21, 63, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (22, 70, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (23, 71, N'1.g')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (24, 72, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (25, 84, N'27')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (26, 84, N'6')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (27, 93, N'f')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (28, 84, N'8')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (29, 84, N'13')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (30, 98, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (31, 100, NULL)
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (32, 102, N'b')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (33, 102, N'a')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (34, 102, N'c')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (35, 102, N'd')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (36, 107, N'e')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (37, 53, N'1')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (38, 53, N'2')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (39, 54, N'a.2')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (40, 54, N'a.4')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (41, 74, N'1.a')
INSERT [dbo].[Articulos] ([codigo_articulo], [articulo], [inciso]) VALUES (42, 38, NULL)
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
INSERT [dbo].[Normativas] ([codigo_normativa], [normativa]) VALUES (8560, N'Ley Provincial de Transito 8560')
GO
SET IDENTITY_INSERT [dbo].[Infracciones] ON 

INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (5, 8560, N'804', N'Conducir con tasas de alcoholemia superior a las admisibles.', 4, 1, N'Muy Grave', 1, 1, 1)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (8, 8560, N'802', N'Conducir habiendo ingerido estupefacientes, psicotrópicos,estimulantes u otras sustancias análogas.', 5, 1, N'Muy Grave', 1, 1, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (12, 8560, N'1704', N'Negarse a realizar las pruebas expresamente autorizadas para determinar su grado de intoxicación al', 6, 1, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (13, 8560, N'304', N'Circular con vehículos que emitan gases, humos, ruidos,radiaciones u otras emanaciones contaminante', 7, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (16, 8560, N'607', N'No respetar las vías o carriles exclusivos.', 8, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (20, 8560, N'1301', N'Conducir sin ambas manos sobre el volante de dirección.', 9, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (21, 8560, N'1302', N'Conducir llevando personas, bultos o animales entre los brazos o a la izquierda del conductor.', 9, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (22, 8560, N'1303', N'Ceder el conductor a otro el control de la dirección.', 9, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (23, 8560, N'1315', N'Circular el vehículo sin exigencias mínimas de seguridad.', 10, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (24, 8560, N'919', N'Quedar detenido con su vehículo en una intersección constituyendo un obstáculo para la circulación.', 11, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (25, 8560, N'410', N'Por girar a la izquierda en vías de doble mano reguladas por semáforo sin señal que lo permita.', 12, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (26, 8560, N'611', N'Circular sin ajustarse a las normas que establecen el uso de los carriles.', 13, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (27, 8560, N'610', N'Circular por autopistas sin ajustarse a las normas establecidas para las mismas.', 14, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (28, 8560, N'332', N'Circular sin llevar encendidas las luces de uso nocturno más las luces de niebla, cuando existan co', 15, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (29, 8560, N'335', N'Circular con luz alta en zonas urbanas.', 16, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (30, 8560, N'336', N'Circular con luz alta en zona rural cuando haya vehículos circulando en sentido contrario o cuando', 16, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (32, 8560, N'341', N'No llevar encendida la luz baja, las luces de posición, y la luz
de chapa de dominio, y en forma s', 41, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (33, 8560, N'601', N'Por circular a contramano, sobre los separadores de tránsito o fuera de la calzada, salvo sobre la', 17, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (35, 8560, N'605', N'Realizar movimientos zigzagueantes, caprichosos o intempestivos y/o frenadas bruscas.', 18, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (36, 8560, N'506', N'Reducir considerablemente la velocidad de su vehículo (salvo en caso de inminente peligro), poniend', 19, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (39, 8560, N'921', N'Penetrar con su vehículo en una intersección o en un paso para peatones, aún cuando goce de priorid', 11, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (41, 8560, N'502', N'No guardar distancia prudente del vehículo que lo precede.', 19, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (42, 8560, N'602', N'Circular marcha atrás, salvo en los casos en que no sea posible marchar hacia adelante.', 21, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (43, 8560, N'721', N'Efectuar la parada y/o el estacionamiento de manera que el vehículo obstaculice la circulación o co', 22, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (45, 8560, N'725', N'Estacionar o detenerse en autopistas o autovías.', 23, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (46, 8560, N'1402', N'Cruzar un paso a nivel ante la proximidad de un vehículo ferroviario y/o sin respetar las señales d', 24, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (47, 8560, N'1403', N'Detenerse a menos de 5 mts. de los rieles del ferrocarril cuando no hubiere barrera.', 25, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (49, 8560, N'1404', N'Detenerse obstaculizando el libre movimiento de las barreras y/o sobre los rieles del ferrocarril.', 24, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (51, 8560, N'608', N'Circular en caminos, los ómnibus y camiones entre sí a una distancia menor a cincuenta metros.', 19, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (52, 8560, N'1810', N'Transportar animales o sustancias nauseabundas en infracción a las normas reglamentarias.', 27, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (53, 8560, N'1811', N'Transportar arena y/o aserrín y/o escombros y/o grava y/o tierra y/o cualquier carga a granel o pol', 27, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (54, 8560, N'1818', N'Transportar residuos que difundan olor desagradable, emanaciones nocivas o sea insalubre.', 26, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (55, 8560, N'1813', N'Transportar carga o elemento que afecte las condiciones aerodinámicas del vehículo.', 20, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (57, 8560, N'1814', N'Transportar carga o elemento que oculte indicadores, las luces y/o perturbe la visibilidad.', 28, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (59, 8560, N'1815', N'Transportar carga o elemento que sobresalga los límites permitidos.', 20, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (60, 8560, N'330', N'Usar la bocina o señales acústicas; salvo en caso de peligro, y/o tener el vehículo sirena o bocina', 29, 2, N'Leve', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (62, 8560, N'803', N'Conducir utilizando auriculares y/o sistemas de comunicación de operación manual. Se permite el uso', 9, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (63, 8560, N'1307', N'Se prohíbe el uso y el emplazamiento de pantallas de televisión en todo tipo de vehículos, que perm', 42, 2, N'Muy Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (64, 8560, N'1305', N'No señalizar la colocación y/o existencia de obstáculos en la vía pública.', 42, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (65, 8560, N'2302', N'Por circular con vehículo de emergencia en infracción a las normas establecidas para los mismos.', 30, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (67, 8560, N'108', N'Por utilizar franquicia de tránsito no reglamentaria, o usarla indebidamente.', 31, 2, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (68, 8560, N'922', N'No respetar la prioridad de paso en tramos estrechos.', 37, 3, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (69, 8560, N'923', N'No respetar la prioridad de paso en tramos estrechos y de gran pendiente.', 38, 3, N'Grave', 1, 0, 0)
INSERT [dbo].[Infracciones] ([codigo_infraccion], [codigo_normativa], [nomenclatura], [descripcion], [codigo_articulo], [codigo_grupo], [calificacion], [estado], [habilitado_retuvo_licencia], [habilitado_retuvo_vehiculo]) VALUES (70, 8560, N'404', N'No detenerse con luz roja del semáforo.', 39, 3, N'Muy Grave', 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Infracciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([id_pais], [pais]) VALUES (1, N'Argentina')
INSERT [dbo].[Paises] ([id_pais], [pais]) VALUES (2, N'Chile')
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 

INSERT [dbo].[Provincias] ([id_provincia], [provincia], [id_pais]) VALUES (1, N'Córdoba', 1)
INSERT [dbo].[Provincias] ([id_provincia], [provincia], [id_pais]) VALUES (2, N'Buenos Aires', 1)
SET IDENTITY_INSERT [dbo].[Provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidades] ON 

INSERT [dbo].[Localidades] ([id_localidad], [localidad], [id_provincia]) VALUES (1, N'Capital', 1)
INSERT [dbo].[Localidades] ([id_localidad], [localidad], [id_provincia]) VALUES (2, N'Río Ceballos', 1)
SET IDENTITY_INSERT [dbo].[Localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_Documentos] ON 

INSERT [dbo].[Tipos_Documentos] ([id_tipo_documento], [tipo_documento]) VALUES (1, N'DNI')
INSERT [dbo].[Tipos_Documentos] ([id_tipo_documento], [tipo_documento]) VALUES (2, N'LC')
INSERT [dbo].[Tipos_Documentos] ([id_tipo_documento], [tipo_documento]) VALUES (3, N'CUIT')
SET IDENTITY_INSERT [dbo].[Tipos_Documentos] OFF
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (5, N'Juan', N'Lopez', 1, N'39800700', 1, N'Manuel Oribe 600', 5008)
INSERT [dbo].[Personas] ([id_persona], [nombre], [apellido], [id_tipo_documento], [numero_documento], [id_localidad], [direccion], [codigo_postal]) VALUES (6, N'Ana', N'Perez', 1, N'39400100', 1, N'Rodriguez del Busto 200', 5009)
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([id_marca], [marca]) VALUES (1, N'Citroen')
INSERT [dbo].[Marcas] ([id_marca], [marca]) VALUES (2, N'Fiat')
INSERT [dbo].[Marcas] ([id_marca], [marca]) VALUES (3, N'Yamaha')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_vehiculos] ON 

INSERT [dbo].[Tipos_vehiculos] ([id_tipo_vehiculo], [tipo_vehiculo]) VALUES (1, N'Auto')
INSERT [dbo].[Tipos_vehiculos] ([id_tipo_vehiculo], [tipo_vehiculo]) VALUES (2, N'Moto')
SET IDENTITY_INSERT [dbo].[Tipos_vehiculos] OFF
GO
SET IDENTITY_INSERT [dbo].[MarcasxTipos_vehiculos] ON 

INSERT [dbo].[MarcasxTipos_vehiculos] ([id_marca_tipo_vehiculo], [id_tipo_vehiculo], [id_marca]) VALUES (1, 1, 1)
INSERT [dbo].[MarcasxTipos_vehiculos] ([id_marca_tipo_vehiculo], [id_tipo_vehiculo], [id_marca]) VALUES (2, 2, 3)
SET IDENTITY_INSERT [dbo].[MarcasxTipos_vehiculos] OFF
GO
INSERT [dbo].[Operadores] ([id_operador], [habilitado], [id_persona], [usuario], [contraseña]) VALUES (1, 1, 6, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Inspectores] ON 

INSERT [dbo].[Inspectores] ([id_inspector], [habilitado], [id_persona], [matricula], [rango_comienzo_acta], [rango_fin_acta]) VALUES (1, 1, 5, N'4784123', 100, 200)
INSERT [dbo].[Inspectores] ([id_inspector], [habilitado], [id_persona], [matricula], [rango_comienzo_acta], [rango_fin_acta]) VALUES (2, 1, 6, N'5052131', 201, 300)
SET IDENTITY_INSERT [dbo].[Inspectores] OFF
GO
SET IDENTITY_INSERT [dbo].[Responsabilidades_Legales] ON 

INSERT [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal], [responsabilidad_legal]) VALUES (1, N'Titular')
INSERT [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal], [responsabilidad_legal]) VALUES (2, N'Infractor')
INSERT [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal], [responsabilidad_legal]) VALUES (3, N'Responsable Civil')
INSERT [dbo].[Responsabilidades_Legales] ([id_responsabilidad_legal], [responsabilidad_legal]) VALUES (4, N'Tutor')
SET IDENTITY_INSERT [dbo].[Responsabilidades_Legales] OFF
GO
