function CoolPlannerOptimizations(global) {
    'use asm';

    var Math_pow = global.Math.pow;
    var Math_round = global.Math.round;

    var pow = 0.0;

    function enforcePrecisionWasm(val, nDecimalDigits) {
        val = +val;
        nDecimalDigits = nDecimalDigits|0;

        pow = +Math_pow(10, nDecimalDigits);
        return +Math_round(val * pow) / pow;
    }

    return {enforcePrecisionWasm: enforcePrecisionWasm};
}
