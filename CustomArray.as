package
{
	/**
	 * <p>Description: create a fixed length array</p>
	 * <b>Example</b></br>
	 * var arr:CustomArray=new CustomArray(5);</br></br>
	 * <ul>
	 * <li>Created time：2013-6-8 下午6:05:56 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */ 
	public dynamic class CustomArray extends Array
	{
		private var _arrLength:int;
		
		public function CustomArray(arrLength:int = 0)
		{
			_arrLength = arrLength;
		}
		
		/**
		 * just save fixed number data
		 * @param parameters
		 * @return 
		 * 
		 */		
		override AS3 function push(... parameters):uint
		{
			while (this.length >= _arrLength && _arrLength != 0)
			{
				this.splice(0, 1);
			}
			return super.push(parameters);
		}
	}
} 