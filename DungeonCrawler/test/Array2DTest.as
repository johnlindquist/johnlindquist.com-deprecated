/**
 _*_User:_John_Lindquist
 _*_Date:_2/15/11
 _*_Time:_10:45_PM
 _*/
package
{
	import collections.Array2D;

	import org.flexunit.asserts.assertEquals;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.array;

	public class Array2DTest
	{
		[Test]
		public function creating_a_10_by_10_2d_array_should_give_you_10_columns_and_10_rows():void
		{
			var array2D:Array2D = new Array2D(10, 10, 0);
			assertEquals(array2D.columns, 10);
			assertEquals(array2D.rows, 10);
		}


		[Test]
		public function creating_a_2_by_2_array_should_result_in_an_array_with_2_nested_arrays_each_with_the_length_of_2():void
		{
			var array2D:Array2D = new Array2D(2, 2, 0);
			assertThat(array2D.source, array(array(0, 0), array(0, 0)))
		}

		[Test]
		public function populating_an_array_2d_with_1s_should_return_all_1s():void
		{
			var array2D:Array2D = new Array2D(3, 3, 0);
			array2D.populate(1);
			assertThat(array2D.source, array(array(1, 1, 1), array(1, 1, 1), array(1, 1, 1)));
		}


	}
}