let inverseY, drawUfo, plrcolor;
let [step, drawplr, plr, player, ufo] = [
    0, false, {x:0,y:0}, {x:0,y:0}, {x: 0, y: 0, enabled: false}
];


function drawPlayer(x,y) {
    drawplr = true;
    plr.x = x;
    plr.y = y;
}

function setup() {
    inverseY = function(position) {
        return windowHeight-position;
    }

    plrcolor = color(random(150,200),random(100,200),random(50,200));
    
    drawUfo = function(x, y, a) {
        push();
        noStroke();
        if (a) {
            let temp = color(100,200,100);
            temp.setAlpha(150);
            fill(temp);
            triangle(25+x,inverseY(0), 100+x,inverseY(150+y), 175+x,inverseY(0));
        }
        if (drawplr) {
            fill(plrcolor);
            ellipse(10+plr.x,inverseY(100+plr.y),20,20);
            rect(5+plr.x,inverseY(90+plr.y),10,55);
            rect(15+plr.x,inverseY(90+plr.y),5,42.5);
            rect(plr.x,inverseY(90+plr.y),5,42.5);
            rect(12.5+plr.x,inverseY(42.5+plr.y),7.5,45);
            rect(plr.x,inverseY(42.5+plr.y),7.5,45);
            drawplr = false;
        }
        fill(100);
        ellipse(100+x, inverseY(100+y), 100, 100);
        fill(200);
        ellipse(100+x, inverseY(50+y), 200, 100);
        pop();
    }
    
    createCanvas(windowWidth, windowHeight);
}

function draw() {
    step += 2;
    background(color(50,100,200));

    if (step <= 300) {
        ufo.x += 2;
        ufo.y += 4;
    } else if (step <= 800) {
        ufo.enabled = true;
        player.y += 2;
    } else if (step <= 1100) {
        ufo.x += (windowWidth/100);
        ufo.enabled = false;
    } else if (step <= 1400) {
        if (ufo.x >= 1000) {
            ufo.x = 0;
        }
        ufo.x += 2;
    } else if (step <= 1900) {
        ufo.enabled = true;
        player.y -= 2;
    } else if (step <= 2200) {
        ufo.x += (windowWidth/100);
        ufo.enabled = false;
    } else if (step > 2200) {
        step = 0;
        ufo.x = 0;
        ufo.y = 0;
    }
    
    drawUfo(ufo.x-200,ufo.y-200,ufo.enabled);
    
    if (player.y <= 400 && (step <= 800 || step >= 1400)) {
        drawPlayer(190,player.y);
    }

    if (step == 1100 || step == 1102) {
        plrcolor = color(random(150,200),50,random(50,200));
    }
}
