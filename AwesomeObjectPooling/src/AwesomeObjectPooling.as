package
{
	import com.johnlindquist.objectpool.IPooledObject;
	import com.johnlindquist.objectpool.SomeObject;

	import flash.display.Sprite;

	public class AwesomeObjectPooling extends Sprite
	{
		public function AwesomeObjectPooling()
		{
//			our pool has 3 instances, so the code below traces out the following
//			[trace] Hello, I'm #1
//			[trace] Hello, I'm #2
//			[trace] Hello, I'm #3
//			[trace] Sorry, the pool was empty...
//			[trace] Hello, I'm #3
			
			var object1:IPooledObject = new SomeObject() as IPooledObject;
			trace(object1.sayHi());
			var object2:IPooledObject = new SomeObject() as IPooledObject;
			trace(object2.sayHi());
			var object3:IPooledObject = new SomeObject() as IPooledObject;
			trace(object3.sayHi());
			
			//The pool is empty here
			var object4:IPooledObject = new SomeObject() as IPooledObject;
			trace(object4.sayHi());
			
			//call "dispose" on the 3rd object to put it back in the pool
			object3.dispose();
			var object5:IPooledObject = new SomeObject() as IPooledObject;

			trace(object5.sayHi());
		}
	}
}




