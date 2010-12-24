/**
 * User: John Lindquist
 * Date: Aug 31, 2010
 * Time: 12:02:32 PM
 */
package patterncraft.chain
{
    import flash.display.Sprite;
    import flash.events.Event;

    public class Marine extends Sprite
    {
        private var _health:Number;
        
        public function Marine()
        {
            health = Math.random() + .3;

            graphics.beginFill(0x00ff00);
            graphics.drawRect(-2,-2, 4, 4);
            graphics.beginFill(0x00ff00);
        }

        public function get health():Number
        {
            return _health;
        }

        public function set health(value:Number):void
        {
            _health = value;
            if(_health == 1)
            {
                dispatchEvent(new Event(Event.CHANGE));
            }
        }
    }
}