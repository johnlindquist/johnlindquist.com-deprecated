/**
 * User: John Lindquist
 * Date: Sep 8, 2010
 * Time: 10:24:27 PM
 */
package patterncraft.command
{
    import com.greensock.TweenMax;

    import flash.display.Sprite;

    public class SCV extends Sprite
    {
        public function SCV()
        {
            graphics.beginFill(0x0000cc);
            graphics.drawRect(-15, -15, 30, 30);
            graphics.endFill();
        }

        public function attack():TweenMax
        {
            var attackTween:TweenMax = TweenMax.to(this, 1, {bezierThrough:[{rotation:180}], rotation:0});
            return attackTween;
        }


        public function gather():TweenMax
        {
            var gatherTween:TweenMax = TweenMax.to(this, 1, {bezierThrough:[{scaleX:2, scaleY:2}], scaleX:1, scaleY:1});
            return gatherTween;
        }

        public function move(targetX:Number, targetY:Number):TweenMax
        {
            var moveTween:TweenMax = TweenMax.to(this, 1, {x:targetX, y:targetY});
            return moveTween;
        }
    }
}