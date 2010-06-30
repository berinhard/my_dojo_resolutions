function happyNumber(number){

    var _olderNumbers = new Array()
    var operated_number = number

    while (operated_number != 1 && _olderNumbers.indexOf(operated_number) == -1){
        _olderNumbers.push(operated_number);
        var splittedNumber = splitNumber(operated_number);
        operated_number = sumPowArray(splittedNumber);
    }

    if (operated_number== 1){
        return "I'm happy";
    } else {
        return "I'm sad";
    }

}

function splitNumber(number){
    var _strNumber = new String(number);
    var _splittedNumber = new Array();
    for (var i = 0; i < _strNumber.length; i++)
    {
        _splittedNumber.push(parseInt(_strNumber[i]));
    }
    return _splittedNumber;
}

function sumPowArray(splittedNumber){
    var sum = 0;
    for (var i = 0; i < splittedNumber.length; i++)
    {
        sum += Math.pow(splittedNumber[i], 2);
    }
    return sum;
}
