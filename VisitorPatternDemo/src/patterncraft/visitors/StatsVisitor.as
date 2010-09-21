/**
 * User: John Lindquist
 * Date: Sep 21, 2010
 * Time: 2:43:08 AM
 */
package patterncraft.visitors
{
    import patterncraft.units.Armored;
    import patterncraft.units.Light;

    public class StatsVisitor implements IVisitor
    {
        public var groupMaxHitPoints:Number = 0;
        public var groupHitPoints:Number = 0;
        
        public function visitLight(light:Light):void
        {
            groupMaxHitPoints += light.maxHitPoints;
            groupHitPoints += light.hitPoints;
            
        }

        public function visitArmored(armored:Armored):void
        {
            groupMaxHitPoints += armored.maxHitPoints;
            groupHitPoints += armored.hitPoints;
        }

        public function print():void
        {
            trace("Total", groupHitPoints, "/", groupMaxHitPoints);
        }
    }
}