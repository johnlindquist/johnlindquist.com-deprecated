/**
 * User: John Lindquist
 * Date: Aug 31, 2010
 * Time: 2:25:55 AM
 */
package patterncraft.state
{
    public interface ISiegeTankState
    {
        function get damage():Number;

        function get canMove():Boolean;

        function get color():uint;
        
        function move(targetX:Number, targetY:Number):void
        
        function attack():void
        
        function toTankMode():void;
        
        function toSiegeMode():void;
        
        function toSpeedMode():void;
    }
}