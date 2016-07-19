# Reemplazar imgs

Script que sustituya todas las imágenes de las entradas de Genbeta por imágenes dummy de gatitos:

```javascript
var domImg = document.querySelectorAll('img'),
    imgSrc = '',
    imgW = '',
    imgH = '',
    randomImg = '';

for (var i = 0; i < domImg.length; ++i) {

    var imgSrc = domImg[i].getAttribute("src"),
        imgW = domImg[i].getAttribute("width") || 600,
        imgH = domImg[i].getAttribute("height") || 600,
        randomImg = 'https://placekitten.com/'+imgW+'/'+imgH;

    domImg[i].setAttribute("srcset",randomImg);

    console.log(domImg[i].src);
    domImg[i].src = randomImg;
}

console.info('Se han reemplazado '+domImg.length+' por gatetes, me habían dicho que te gustaban ;)');
```
