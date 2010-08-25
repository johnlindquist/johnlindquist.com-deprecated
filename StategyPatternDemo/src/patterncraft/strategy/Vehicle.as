/**
 * User: John Lindquist
 * Date: Aug 24, 2010
 * Time: 11:19:49 PM
 */
package patterncraft.strategy
{
    import flash.display.Sprite;

    public class Vehicle extends Sprite
    {
        public var moveBehavior:IMoveVehicleBehavior;

        public function move(tweenVars:Object):void
        {
            moveBehavior.move(this, tweenVars);
        }
    }
}