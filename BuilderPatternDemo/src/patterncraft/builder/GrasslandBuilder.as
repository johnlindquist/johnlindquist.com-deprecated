/**
 * User: John Lindquist
 * Date: 5/18/11
 * Time: 12:01 PM
 */
package patterncraft.builder {
    public class GrasslandBuilder extends MapBuilder {
        public function GrasslandBuilder() {
        }

        override public function createBackground():void {
            map.background = "grassland background"
        }

        override public function createTerrain():void {
            map.terrain = "grassland terrain";
        }

        override public function createMinerals():void {
            map.minerals = "grass minerals";
        }
    }
}
