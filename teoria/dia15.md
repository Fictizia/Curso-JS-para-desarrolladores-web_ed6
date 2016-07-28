# Clase 15

### JSDocs

```javascript

/** @namespace */
var app = {};

/**
 * Resuelve la división de a/b
 * @example
 * // retorna 3
 * globalNS.metodo(5, 15);
 * @returns {Number} Retorna el resultado de la operación.
 */
app.metodo = function (a, b) {
    return b / a;
};
```

- [Documentación oficial](http://usejsdoc.org/tags-example.html)
- [Speaking JavaScript (Axel Rauschmayer) - Chapter 29. JSDoc: Generating API Documentation](http://speakingjs.com/es5/ch29.html)

### Guías de estilo

- [idiomatic.js](https://github.com/rwaldron/idiomatic.js/)
- [MDN Coding style](https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Coding_Style#JavaScript_practices)
- [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
- [Google JavaScript Style Guide](https://google.github.io/styleguide/javascriptguide.xml)


> Todo el código en cualquier proyecto debería verse como si una sola persona lo hubiera escrito, sin importar cuánta gente haya contribuído. 
> Idiomatic.js

Desventajas:
- Adopción total del equipo
- Curva de aprendizaje
- Falta de plugins

### Versionamiento Semántico (Semver)

![img](https://blog.gopheracademy.com/postimages/advent-2015/semver.png)


[semver](http://semver.org/lang/es/)

### Expresiones Regulares 

- **Recursos:**
    - [10 Expresiones Regulares Imprescindibles en Desarrollo Web](http://web.ontuts.com/snippets/10-expresiones-regulares-imprescindibles-en-desarrollo-web/)
    - [Common Regular Expressions in Javascript](http://geniuscarrier.com/common-regular-expressions-in-javascript/)

- **Documentación:**
    - [Expresiones Regulares en MDN](https://developer.mozilla.org/es/docs/Web/JavaScript/Guide/Regular_Expressions)

- **Herramientas:**
    - [regexr](http://regexr.com/) 
    - [Regular Expressions Cheat Sheet by DaveChild](http://www.cheatography.com/davechild/cheat-sheets/regular-expressions/)


### Rendimiento
- [jsPerf](http://jsperf.com/)
- [benchmark.js](http://benchmarkjs.com/)


### Mundo Node

![Node_logo](https://nodejs.org/static/images/logos/nodejs.png)
- Comprobar version:
```
    node -v
```

**Librerías interesantes**
- [Socket.io](https://www.npmjs.com/package/socket.io)
- [Bower](https://www.npmjs.com/package/bower)
- [Gulp](https://www.npmjs.com/package/gulp)
- [Grunt](https://www.npmjs.com/package/grunt)
- [X-ray](https://www.npmjs.com/package/x-ray)
- [Cheerio](https://www.npmjs.com/package/cheerio)
- [Expressjs](http://expressjs.com/)
- [Passportjs](http://passportjs.org/)
- [Johnny-five](http://johnny-five.io/)
- [Cylonjs](https://cylonjs.com/)
- [Nodecopter](http://www.nodecopter.com/hack)
- [Pdfkit](http://pdfkit.org/)

**NPM**

![npm_logo](http://ohdoylerules.com/content/images/npm-logo.svg)

- Comprobar version:
```
    npm -v
```

**package.json**

- Datos proyecto
- Tareas
- Dependencias (dependencies y devDependencies)

- Dependency Hell:
  - [Nodei.co](https://nodei.co/)
  - [Dependency Hell](http://www.wikiwand.com/en/Dependency_hell)
  - [David Dm](https://david-dm.org/)
    - [Ejemplo Twitter-sentiments](https://david-dm.org/UlisesGascon/twitter-sentiments#info=dependencies&view=list)
    - [Ejemplo Grunt](https://david-dm.org/gruntjs/grunt#info=dependencies&view=table)
    - [Ejemplo Express](https://david-dm.org/strongloop/express)
    - [Ejemplo Bower](https://david-dm.org/bower/bower#info=dependencies&view=table)
  - [ShieldsIO](http://shields.io/)
    - [Your Badge Service](http://badges.github.io/gh-badges/) 



- Hello World con HTTP:
```javascript
  var http = require('http');
  
  var puerto = 3000;
  var direccion = "127.0.0.1";
  var mensaje = 'Hola a todos, ahora usando HTTP\n';
  
  
  http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end(mensaje);
  }).listen(puerto, direccion);
  console.log('Server running at http://'+direccion+':'+puerto+'/');
```

- Hello World desde c9.io:
```javascript
  var http = require('http');
  
  var mensaje = 'Hola a todos, ahora usando HTTP con C9.io\n';
  
  http.createServer(function(req, res) {
      res.writeHead(200, {'Content-Type': 'text/plain'});
      res.end(mensaje);
  }).listen(process.env.PORT, process.env.IP);
  
  console.log('Server running at http://'+process.env.IP+':'+process.env.PORT+'/');
```

- Redireccionamiento:
```javascript
  var http = require('http');
  
  http.createServer(function (req, res) {
    res.writeHead(301, {
      'Location': 'http://www.google.es/'
    });
      res.end();
  }).listen(process.env.PORT, process.env.IP);
  
  console.log('Servidor funcionando en http://'+process.env.IP+':'+process.env.PORT+'/');
```


**Gulp**

![Gulp](http://codehangar.io/content/images/2015/10/gulp-logo.jpg)


- [Grunt vs. Gulp](http://www.slideshare.net/appleboy/automating-your-workflow-with-gulp)
- [Quenchjs - Generador web](http://quenchjs.com/)

- Plugins destacados:
    - [Todos los Plugins](http://gulpjs.com/plugins/)
    - [uncss](https://www.npmjs.com/package/gulp-uncss/)
    - [gulp-load-plugins](https://www.npmjs.com/package/gulp-load-plugins/)
    - [gulp-clean](https://github.com/peter-vilja/gulp-clean)
    - [gulp-concat](https://github.com/contra/gulp-concat)
    - [gulp-uglify](https://github.com/terinjokes/gulp-uglify)
    - [gulp-reveal](https://www.npmjs.com/package/gulp-reveal)

**Yeoman**
![Yeoman Logo](https://raw.githubusercontent.com/yeoman/media/master/optimized/yeoman-masthead.png)
> The Yeoman workflow comprises three types of tools for improving your productivity and satisfaction when building a web app: the scaffolding tool (yo), the build tool (Grunt, Gulp, etc) and the package manager (like Bower and npm).

- [Yeoman Instalation Working Flow](https://www.youtube.com/watch?v=zBt2g9ekiug)
- [Yeoman - Generator-webapp](https://github.com/yeoman/generator-webapp)
- [Yeoman - Santa Barbara JavaScript Meetup](http://www.slideshare.net/tim_doherty/yeoman-santa-barbara-bjava-scriptmeetup)
- [Automating Your Front-end Workflow with Yeoman 1.0 (Addy Osmani)](https://www.youtube.com/watch?v=1OAfGm_cI6Y)



**Express**

![Express_logo](https://i.cloudup.com/zfY6lL7eFa-3000x3000.png)

- Middelware
![Mw_schema](http://image.slidesharecdn.com/introtonode-140914093424-phpapp01/95/intro-to-nodejs-14-638.jpg?cb=1410687757)


### NoBackend

![fb_logo](http://www.livechat.codeteam.in/images/firebase-logo.png)

**[Firebase](https://www.firebase.com/)**
- [Base de datos NoSQL](https://www.firebase.com/docs/web/guide/understanding-data.html)
- [Social Login](https://www.firebase.com/docs/web/guide/user-auth.html)
- [Despliege](https://www.firebase.com/docs/web/guide/deploying.html)



### Extras

**[El largo camino del desarrollador web](https://coggle.it/diagram/52e97f8c5a143de239005d1b/56212c4e4c505e0045c0d3bda59b77e5977c2c9bd40f3fd0b451bdcf8da4aa52)**


**[¿Cómo seguir aprendiendo después de este curso?](extra.md)**
