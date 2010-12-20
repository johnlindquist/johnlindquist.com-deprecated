package
{
	import flash.display.Sprite;

	import patterncraft.decorator.ArmorUpgrade;
	import patterncraft.decorator.Infantry;
	import patterncraft.decorator.Marauder;
	import patterncraft.decorator.Marine;
	import patterncraft.decorator.WeaponUpgrade;

	public class DecoratorPatternDemo extends Sprite
	{
		public function DecoratorPatternDemo()
		{
			var marine:Infantry = new Marine();
			marine = new WeaponUpgrade(marine);	
		}
	}
}
