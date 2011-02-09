/**
 * User: John Lindquist
 * Date: Aug 31, 2010
 * Time: 12:02:32 PM
 */
package patterncraft.chain
{
	import com.greensock.TweenMax;

	import flash.display.Sprite;
    import flash.events.Event;

    public class Marine extends Sprite
    {
        private var _health:Number;
        
        public function Marine()
        {
            health = Math.random() + .3;

            graphics.beginFill(0x00ff00);
            graphics.drawRect(-8,-8, 16, 16);
            graphics.beginFill(0x00ff00);

	        TweenMax.to(this, 0, {colorTransform:{tint:0xff0000, tintAmount:health}});
        }

        public function get health():Number
        {
            return _health;
        }

        public function set health(value:Number):void
        {
            if(value == 1)
            {
	            dispatchEvent(new Event(Event.CHANGE));
            }
	        _health = value;
        }
    }
}