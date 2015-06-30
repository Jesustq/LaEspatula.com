-- phpMyAdmin SQL Dump
-- version 4.3.6
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-06-2015 a las 08:26:28
-- Versión del servidor: 5.6.22
-- Versión de PHP: 5.4.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ci2413_eb04539`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE IF NOT EXISTS `Categorias` (
  `nombre` varchar(30) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Categorias`
--

INSERT INTO `Categorias` (`nombre`, `descripcion`) VALUES
('Reposteria', 'pan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ingredientes`
--

CREATE TABLE IF NOT EXISTS `Ingredientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` text,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Ingredientes`
--

INSERT INTO `Ingredientes` (`id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 'Masa de hojaldre', 'El hojaldre es una masa crujiente traída a Europa por los árabes, aunque su origen es anterior, pudiendo encontrarse referencias a pastas y masas hojaldradas en la Grecia y Roma clásicas', 'http://www.donpostre.com/wp-content/uploads/masa-hojaldre.jpg'),
(2, 'Queso Mozzarella', 'Tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua.', 'http://www.haciendacochaucoecuador.com/wp-content/uploads/2015/03/Mozzarella-cheese-and-basil-on-a-w'),
(3, 'Jamón', 'Producto alimenticio obtenido de las patas traseras del cerdo.', 'http://www.jamonesquesadacarpio.com/wp-content/uploads/2014/06/BODEGO3.jpg'),
(4, 'Huevo', NULL, 'http://dietas.elembarazo.net/wp-content/uploads/sites/6/2012/08/huevos-y-embarazo.jpg'),
(5, 'Agua', NULL, ''),
(6, 'Semillas de Ajonjoli', 'También conocido como sésamo', 'http://elheraldoslp.com.mx/wp-content/uploads/2015/04/2324.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recetas`
--

CREATE TABLE IF NOT EXISTS `Recetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `instrucciones` text NOT NULL,
  `creador` int(11) NOT NULL DEFAULT '0' COMMENT 'id del usuario creador',
  `imagen` varchar(100) DEFAULT NULL,
  `tips` text,
  `calificacion` int(11) DEFAULT '0',
  `categoria` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Recetas`
--

INSERT INTO `Recetas` (`id`, `nombre`, `instrucciones`, `creador`, `imagen`, `tips`, `calificacion`, `categoria`) VALUES
(2, 'Empanadas de jamón y queso', '- Precalienta el horno a 375 °F.\r\n- Estira la masa de hojaldre cuidadosamente. Con un cortador circular, corta la masa en círculos de aproximadamente 9 pulgadas.\r\n- Mezcla el queso y el jamón en recipiente pequeño. Reserva.\r\n- Agrega 2 cucharadas de la mezcla de queso y jamón en el centro de cada círculo. Dobla y sella los bordes con los dientes de un tenedor.\r\n- Mezcla el huevo con el agua. Reserva.\r\n- Coloca las empanadas en una bandeja grande para hornear y píntalas con la mezcla de huevo. Rocía con las semillas de ajonjolí, si deseas.\r\n- Hornea por 15-20 minutos, o hasta que las empanadas estén doradas.\r\n- Sirve inmediatamente.', 1, 'http://s3.amazonaws.com/gmi-digital-library/226e0d9f-b30f-4063-a321-1309d200faf7.jpg', 'Cocinar. No sabe bien crudo', 5, 'Reposteria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rec_Ing`
--

CREATE TABLE IF NOT EXISTS `Rec_Ing` (
  `receta` int(11) NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `unidadDeMedida` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE IF NOT EXISTS `Usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contraseña` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `pais` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`id`, `nombre`, `contraseña`, `correo`, `pais`) VALUES
(1, 'Anonimo', 'passwordparaprobarlapagina', 'andony91@gmail.com', 'Costa Rica');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `Ingredientes`
--
ALTER TABLE `Ingredientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Recetas`
--
ALTER TABLE `Recetas`
  ADD PRIMARY KEY (`id`), ADD KEY `nombre` (`nombre`), ADD KEY `nombre_2` (`nombre`), ADD KEY `nombre_3` (`nombre`), ADD KEY `creador` (`creador`), ADD KEY `categoria` (`categoria`);

--
-- Indices de la tabla `Rec_Ing`
--
ALTER TABLE `Rec_Ing`
  ADD KEY `receta` (`receta`,`ingrediente`), ADD KEY `idIng` (`ingrediente`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Ingredientes`
--
ALTER TABLE `Ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `Recetas`
--
ALTER TABLE `Recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Recetas`
--
ALTER TABLE `Recetas`
ADD CONSTRAINT `catNom` FOREIGN KEY (`categoria`) REFERENCES `Categorias` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `categoNom` FOREIGN KEY (`categoria`) REFERENCES `Categorias` (`nombre`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `userId` FOREIGN KEY (`creador`) REFERENCES `Usuarios` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Rec_Ing`
--
ALTER TABLE `Rec_Ing`
ADD CONSTRAINT `idIng` FOREIGN KEY (`ingrediente`) REFERENCES `Ingredientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `idRec` FOREIGN KEY (`receta`) REFERENCES `Recetas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
