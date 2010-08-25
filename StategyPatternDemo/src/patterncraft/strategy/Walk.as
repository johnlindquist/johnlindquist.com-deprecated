/**
 * User: John Lindquist
 * Date: Aug 24, 2010
 * Time: 11:22:48 PM
 */
package patterncraft.strategy
{
    import com.greensock.TweenMax;

    public class Walk implements IMoveVehicleBehavior
    {
        public function move(vehicle:Vehicle, tweenVars:Object):void
        {
            tweenVars.bezierThrough = [
                {rotation:18},
                {rotation:-18},
                {rotation:18},
                {rotation:-18}
            ];
            TweenMax.to(vehicle, 3, tweenVars);
        }
    }
}