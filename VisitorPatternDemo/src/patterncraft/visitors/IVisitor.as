/**
 * User: John Lindquist
 * Date: Sep 21, 2010
 * Time: 2:42:30 AM
 */
package patterncraft.visitors
{
    import patterncraft.units.Armored;
    import patterncraft.units.Light;

    public interface IVisitor
    {

        function visitLight(light:Light):void;

        function visitArmored(armored:Armored):void;
    }
}