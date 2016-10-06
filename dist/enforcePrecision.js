window.enforcePrecisionJs = function(val, nDecimalDigits) {
    var pow = Math.pow(10, nDecimalDigits);
    return Math.round(val * pow) / pow;
}
