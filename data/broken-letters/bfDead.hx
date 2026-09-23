import substates.GameOverSubstate;
import flixel.FlxG;

var posX:Float = 0;
var posY:Float = -125;

function onGameOverStart() {
    if (GameOverSubstate.instance != null && GameOverSubstate.instance.boyfriend != null) {
        var bf = GameOverSubstate.instance.boyfriend;
        bf.x += posX;
        bf.y += posY;

        FlxG.camera.target = null;
        FlxG.camera.scroll.set(0, 0);
    }
}
