package {

    import flash.display.Sprite;

    import patterncraft.adapter.IUnit;
    import patterncraft.adapter.Marine;
    import patterncraft.adapter.MarioAdapter;
    import patterncraft.adapter.SonicAdapter;
    import patterncraft.adapter.Zealot;
    import patterncraft.adapter.Zergling;

    public class AdapterPatternDemo extends Sprite {
        public function AdapterPatternDemo() {
            var zealot:IUnit = new Zealot();
            var marine:IUnit = new Marine();
            var zergling:IUnit = new Zergling();

            var mario:IUnit = new MarioAdapter();
            var sonic:IUnit = new SonicAdapter();

            var units:Array = [zealot, marine, zergling, mario, sonic];

            for each (var unit:IUnit in units) {
                unit.attack();
            }
        }
    }
}
