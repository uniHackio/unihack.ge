function sourceToDestination(sourceWidth,scale /*from source to destinatio*/ ,sourcePixels,destinationWidth,destinationHeight,destinationPixels) {
    for( var y = 0; y < destinationHeight; y++ ) {
        for( var x = 0; x < destinationWidth; x++ ) {
            var index = (Math.floor(y / scale) * sourceWidth + Math.floor(x / scale)) * 4;
            var indexdestination = (y * destinationWidth + x) * 4;
            destinationPixels.data[ indexdestination ] = sourcePixels.data[ index ];
            destinationPixels.data[ indexdestination+1 ] = sourcePixels.data[ index+1 ];
            destinationPixels.data[ indexdestination+2 ] = sourcePixels.data[ index+2 ];
            destinationPixels.data[ indexdestination+3 ] = sourcePixels.data[ index+3 ];
        }
    }
    return destinationPixels;
}
module.exports = function( img, scale, out) {
    var outCtx, outPixels;
    out.width = img.width;
    out.height = img.height;
    outCtx = out.getContext('2d');
    outCtx.drawImage(img, 0, 0);
    outPixels = outCtx.getImageData(0, 0, out.width, out.height);
    
    var scaled = document.createElement('canvas');
    scaled.width = img.width * scale;
    scaled.height = img.height * scale;
    var scaledCtx = scaled.getContext('2d');
    var scaledPixels = scaledCtx.getImageData( 0, 0, scaled.width, scaled.height );
    scaledCtx.putImageData(
      sourceToDestination(
        out.width,
        scale,
        outPixels,
        scaled.width,
        scaled.height,
        scaledPixels
      ), 0, 0 );
    
    outCtx.putImageData(
      sourceToDestination(
        scaled.width,//img.width * scale
        1/scale,
        scaledPixels,
        out.width,
        out.height,
        outPixels
      ), 0, 0 );
    return out
}