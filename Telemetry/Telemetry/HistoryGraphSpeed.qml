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
        drawHorizontalLine(context, 40.0, "black", 5.0)
        drawHorizontalLine(context, 45.0, "black", 5.0)

        context.font="normal 12px sans-serif";
        context.strokeText("0", 3, height - 20 - 2);
        context.strokeText("5", 3, height - 20 - 2 - 5 * 5);
        context.strokeText("10", 3, height - 20 - 2 - 5 * 10);
        context.strokeText("15", 3, height - 20 - 2 - 5 * 15);
        context.strokeText("20", 3, height - 20 - 2 - 5 * 20);
        context.strokeText("25", 3, height - 20 - 2 - 5 * 25);
        context.strokeText("30", 3, height - 20 - 2 - 5 * 30);
        context.strokeText("35", 3, height - 20 - 2 - 5 * 35);
        context.strokeText("40", 3, height - 20 - 2 - 5 * 40);
        context.strokeText("45", 3, height - 20 - 2 - 5 * 45);


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


