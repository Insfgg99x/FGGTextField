FGGTextField简介<br>
![演示](https://github.com/Insfgg99x/FGGTextField/blob/master/FGGTextField.gif)<br>
----------------------------------------------------------------<br>
FGGTextField继承自UITextField，依赖第三方库AJWValidator，<br>
用于实现文本框输入文本的实时监测，酷炫简介的提示效果。<br>
声明：FGGTextField借鉴了一个名为UITextBox的Swift的库<br>
<br>
用法简介：<br>
---------------------------------------------------------------<br>
1.在项目中导入：FGGTextField.h<br>
2.创建FGGTextField的对象<br>
FGGTextField *tf=[[FGGTextField alloc]initWithFrame:CGRectMake(50, 100, 200, 40)];<br>
3.设置属性<br>
tf.placeholder=@"请输入邮箱";<br>
tf.errorText=@"邮箱格式不正确";<br>
tf.validatorText=@"邮箱";<br>
<br>
tf.borderStyle=UITextBorderStyleRoundedRect;<br>
tf.keyboardType=UIKeyboardTypeEmailAddress;<br>
4.添加到父视图<br>
***********************************<br>
*注意:一定要在设置属性之后再添加到父视图*<br>
***********************************<br>
[self.view addSubview:tf];<br>
不要问为啥要后添加到父视图，我也很想解决这个问题，你就当是一个bug呗-.-<br>
如果找到好的解决办法，欢迎pull request，repository地址是：<br>
https://github.com/Insfgg99x/FGGTextField.git<br>
或者发给我发邮件：newbox0512@yahoo.com<br>
<br>
©夏桂峰<br>
----------------------------------------------------------------<br>