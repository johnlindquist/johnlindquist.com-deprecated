/**
 * User: John Lindquist
 * Date: 5/18/11
 * Time: 12:01 PM
 */
package patterncraft.builder {
    public class DesertBuilder extends MapBuilder {
        public function DesertBuilder() {
        }

        override public function createBackground():void {
            map.background = "desert background"
        }

        override public function createTerrain():void {
            map.terrain = "desert terrain";
        }

        override public function createMinerals():void {
            map.minerals = "desert minerals";
        }

        override public function createSky():void {
            map.sky = "desert sky";
        }
    }
}
