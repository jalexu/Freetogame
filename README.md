# Freetogame 
Proyecto que cuenta con las mejores prácticas y herramientas de desarrollo, además las tecnologías más populares del desarrollo mobile en iOS

## Información general

El proyecto consta de una aplicación que muestra un listado de video Juegos usando el api [Freetogame](https://www.freetogame.com/api-doc), al dar tap en alguna de ellas muestra un detalle de la mismo.
La aplicación también incluye funcionalidades de guardar en realm los marcados como favoritos.


### Requerimientos

* Min XCode version 14.3.1
* Min deployment iOS 16.4
* [API](https://www.freetogame.com/api/games)
* Al abrir se lista las peliculas del API
* Si noy coneexion a internet se ve a la vista de favoritos.
* Se visulaliza el detalle de cada video juego seleccionado.
* Internalizar los mensajes que vengan en las excepciones.

## Funcionalidades
_Puedes hacer lo siguiente en la aplicación_


### Lista los video juegos más recientes
La aplicación te muestra los video juegos más recientes.

### Información detallada de cada video juego
La aplicación muestra en detalle la información de cada juego seleccionado.

### Filtrado
La aplicación permite filtrar por genero del video juego.

## Arquitectura
Se propuso como arquitectura para el proyecto una arquitectura limpia usando DDD (enfocada en el modelo de dominio) y en el apartado de aplicación se usa BLoC 

Se usa el diseño guiado por el dominio ya que provee una estructura de prácticas y terminologías para tomar decisiones de diseño que enfoquen y aceleren el manejo de dominios complejos en los proyectos de software. 


## Estructura del proyecto
Se identifican 3 módulos
* Presentation - Como capa de presentación
* Domain - Como capa de dominio donde encontramos nuestras reglas de negocio y nuestros servicios 
* Infrastructure - Como capa más externa donde encontramos los detalles (Base Datos, Cliente Http, etc).


## Construido con
### [Alomofire](https://github.com/Alamofire/Alamofire) - Cliente HTTP
Se utilizó Alomofire para el consumo de servicios Rest, ya que facilita este trabajo en aplicaciones iOS y es desarrollada por la comunidad open source.
Se agrego un Timeout en cliente Http de 60 segundos. Esto puede cambiar según la necesidad de proyecto.
### [Realm](https://github.com/realm/realm-swift) - Persistencia de datos
Para la base de datos se usó Realm ya que es una biblioteca de terceros rapida y libiana, lo que facilita administrar (guardar, leer y eliminar) datos de Swift.
### [Swinject](https://github.com/Swinject/Swinject) - Inyección de dependencias
Para realizar la inyección de dependencias se usó la librería Injectable la cual proporciona una forma de usar la inyección de dependencias.
Swinject funciona con el sistema de tipos genéricos Swift y funciones de primera clase para definir las dependencias de su aplicación de manera simple y fluida.
### [SwiftUI](https://developer.apple.com/documentation/swiftui/) - Para creacion de las vistas
Una forma más fácil y eficiente de crear interfaces de usuario. Permite la integracion con UIKit.
### [Combine](https://developer.apple.com/documentation/combine) - Reactividad
Combine es un marco para escribir código reactivo, es una libria propia de apple. El marco Combine proporciona una API Swift declarativa, permitiendo trabajar con eventos asíncronos de forma más simplificada.


## Version

**Version name :** 1.0
