import QtQuick 2.0

Canvas {
    property var graphVelocities;

    property var graphSpeed1;
    property var graphSpeed2;

    property bool showSpeed1: true;
    property bool showSpeed2: true;

    onPaint: {
        var context = getContext("2d");
        context.reset();

        // Kitöltés fehérre
        context.fillStyle = "white"
        context.fillRect(0, 0, width, height);

        // Vízszintes vonalak berajzolása a függőleges pozíció, a szín és a függőleges
        //  skálázás megadásával. (Erre van külön függvényünk.)
        drawHorizontalLine(context, 0.0, "black", 5.0)
        drawHorizontalLine(context, 5.0, "black", 5.0)
        drawHorizontalLine(context, 10.0, "black", 5.0)
        drawHorizontalLine(context, 15.0, "black", 5.0)
        drawHorizontalLine(context, 20.0, "black", 5.0)
        drawHorizontalLine(context, 25.0, "black", 5.0)
        drawHorizontalLine(context, 30.0, "black", 5.0)
        drawHorizontalLine(context, 35.0, "black", 5.0)


        // Az adatsorok megrajzolása (a graphTimestamps értékét jelenleg nem használjuk).
        //  Ez is külön függvénybe került.
       drawDataset(context, graphVelocities, "transparent", 5.0);

        if(showSpeed1)drawDataset(context, graphSpeed1, "red", 5.0);
        if(showSpeed2)drawDataset(context, graphSpeed2, "green", 5.0);

        context.stroke();
    } // onPaint vége

    // Vízszintes vonal berajzolása.
    function drawHorizontalLine(context, dataValue, strokeStyle, verticalScaler)
    {
        var offset = height - 20;

        context.beginPath();
        context.lineWidth = 1;
        context.strokeStyle = strokeStyle;
        // Mozgás a vonal elejére.
        context.moveTo(0, offset - verticalScaler * dataValue);
        // Vonal végére mozgás.
        context.lineTo(width, offset - verticalScaler * dataValue);
        context.stroke();
    }

    function drawDataset(context, datarow, strokeStyle, verticalScaler)
    {
        var offset = height - 20;

        context.beginPath();
        context.lineWidth = 3;
        context.strokeStyle = strokeStyle;
        context.moveTo(25, offset-verticalScaler * datarow[0]);
        // A vektoron végigmenve behúzzuk a grafikon szakaszait.
        for(var i=0; i<graphVelocities.length;i++)
        {
            context.lineTo(25+10*i, offset - verticalScaler * datarow[i]);
        }
        context.stroke();
    }
}


