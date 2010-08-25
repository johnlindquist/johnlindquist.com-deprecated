/**
 * User: John Lindquist
 * Date: Aug 24, 2010
 * Time: 11:25:35 PM
 */
package patterncraft.strategy
{
    public interface IMoveVehicleBehavior
    {
        function move(vehicle:Vehicle, tweenVars:Object):void;
    }
}