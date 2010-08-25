/**
 * User: John Lindquist
 * Date: Aug 24, 2010
 * Time: 11:30:52 PM
 */
package patterncraft.strategy
{
    import com.greensock.TweenMax;

    public class Teleport implements IMoveVehicleBehavior
    {
        public function move(vehicle:Vehicle, tweenVars:Object):void
        {
            TweenMax.to(vehicle, 0, tweenVars);
        }
    }
}