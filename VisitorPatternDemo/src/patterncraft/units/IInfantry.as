/**
 * User: John Lindquist
 * Date: Sep 20, 2010
 * Time: 6:38:11 PM
 */
package patterncraft.units
{
    import patterncraft.visitors.IVisitor;

    public interface IInfantry
    {
        function get maxHitPoints():Number;
        function get hitPoints():Number;
        function set hitPoints(value:Number):void;
        function get x():Number;
        function get y():Number;

        function accept(visitor:IVisitor):void;
    }
}