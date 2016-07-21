# Reemplazar imgs

Script que sustituya todas las imágenes de las entradas de Genbeta por imágenes dummy de gatitos:

```javascript
var domImg = document.querySelectorAll('img'),
    imgSrc = '',
    imgW = '',
    imgH = '',
    randomImg = '',
    srclog = [];

for (var i = 0; i < domImg.length; ++i) {

    var imgSrc = domImg[i].getAttribute("src"),
        imgW = domImg[i].getAttribute("width") || domImg[i].width,
        imgH = domImg[i].getAttribute("height") || domImg[i].height,
        randomImg = 'https://placekitten.com/'+imgW+'/'+imgH;

    domImg[i].setAttribute("srcset",randomImg);

    srclog.push({'img number': i, 'original src': domImg[i].src, 'new src':randomImg});
    domImg[i].src = randomImg;
}

console.info('Se han reemplazado '+domImg.length+' por gatetes, me habían dicho que te gustaban ;)');
```
