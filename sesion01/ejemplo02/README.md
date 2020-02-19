[`Lenguajes de Programación`](../../README.md) > [`Sesión 01`](../README.md) > `Ejemplo 01`

## Ejemplo 1: Instalación de Haskell

### OBJETIVO

- Instalar Haskell en un equipo con Windows.

#### REQUISITOS

Ninguno.

#### DESARROLLO

1. Ingresa a la página del instalador: [https://www.haskell.org/platform/windows.html](https://www.haskell.org/platform/windows.html).

2. Elegir el instalador (ya sea de 32 o de 64 bits) y después dar clic en el botón con el nombre del archivo
para iniciar la descarga.

3. Abrir el archivo `.exe` que se descargó y seguir las instrucciones.

3. Verificar que el archivo de configuración de cabal (puede verificarse ejecutando el siguiente comando
en una terminal: cabal user-config init) contiene las siguientes líneas:

   ```bash
   extra - prog - path : C :\ Program Files \ Haskell Platform \8.6.3\ msys \ usr \ bin
   extra - lib - dirs : C :\ Program Files \ Haskell Platform \8.6.3\ mingw \ lib
   extra - include - dirs : C :\ Program Files \ Haskell Platform \8.6.3\ mingw \ include
   ```
*Nota:* Para instalar en otro sistema operativo, pregunta al profesor.   
   
