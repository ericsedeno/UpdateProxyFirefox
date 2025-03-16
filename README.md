# UpdateProxyFirefox

Actualizar proxy y autofirmar sitios en Firefox desde políticas del dominio

**UpdateProxyFirefox** es un script diseñado para automatizar la actualización de los archivos de configuración `prefs.js` y `cert_override.txt` en los perfiles locales de los usuarios de un dominio (`%appdata%\Mozilla\Firefox\Profiles\perfil\`). 
Este script se ejecuta al iniciar sesión y garantiza que la configuración del navegador Firefox esté con los parámetros definidos por el administrador.

## Funcionalidades principales

1. **Configuración centralizada**: Actualiza el archivo `prefs.js` con las preferencias definidas, como por ejemplo: Proxy y sus excepciones, página de inicio, ubicación predeterminada para guardar descargas y asegura que todas las estaciones de trabajo tengan la misma configuración.

2. **Certificados autofirmados**: Al fijar el fichero `cert_override.txt` se autofirman automáticamente páginas seguras (HTTPS) utilizadas en la empresa que no poseen una entidad certificadora, por ejemplo: Sitios internos o páginas como Segurmatica, Virtual Bandec entre otras muchas, además evita que los usuarios vean advertencias de páginas con certificados no firmados.

3. **Personalización flexible**: Facilita la implementación de cambios en toda la organización de manera rápida y eficiente.

## Configuración inicial

1. Tratar de lograr homogeneidad en las versiones de los navegadores de la red, sobre todo por la configuración de `cert_override.txt`. Hasta la versión 104 de Firefox el formato es compatible hacia atrás. Después de esta versión cambió el formato, por lo tanto, un sitio autofirmado en una versión 104 o anterior va a funcionar en una versión superior a 104, no siendo así a la inversa. Por lo tanto, si todos los Firefox de la red son superiores a la versión 104 no debe haber problemas, pero si hay al menos uno anterior o igual a la versión 104 va a ser necesario autofirmar todas las páginas en una versión 104 o inferior.

2. Configurar todas las opciones que se requieran del navegador, página de inicio, proxy, excepciones, ubicación de los ficheros al descargar, etc.

3. Una vez configurados estos dos aspectos hay que copiar `prefs.js` y `cert_override.txt` desde el perfil en que se trabajaron y colocarlos en el `netlogon` del dominio en una carpeta llamada `UpdateProxyFirefox`.

4. Actualizar los datos del script `UpdateProxyFirefox.vbs` para que esté acorde a la red en la que va a funcionar, modificar `tu.dominio.cu` por el dominio real, crear la carpeta `UpdateProxyFirefox` y pegar `prefs.js` y `cert_override.txt`.

5. Verificar que las rutas donde están `prefs.js` y `cert_override.txt` sean accesibles dentro de la red.

6. Acceder a la `Administración de directivas de grupo` y editar `Default Domain Policy`, en `Configuración de Usuario`, `Directivas`, `Configuración de Windows`, `Scripts (inicio de sesión/cierre de sesión)`, `Inicio de sesión`, aquí vamos a seleccionar el script `UpdateProxyFirefox.vbs`. Previamente este script se debió haber ubicado en `\\<nombre_dominio>\SYSVOL\<nombre_dominio>\Policies\{GUID_de_GPO}\User\Scripts`.

## Notas adicionales

Una vez realizados estos pasos los usuarios tendrán sus navegadores Firefox configurados. 

## Autor

MSc. Eric Enrique Sedeño Estrada  
http://acs.nat.cu  
Teléfono: 59938830  
Correo: ericsedeno@gmail.com
