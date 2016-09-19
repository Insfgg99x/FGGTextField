#FGGTextField
..............................................................
##Introduction
一个超级酷炫的文本输入框，继承自UITextField，依赖于AJWValidator.用于实现文本输入的实时监测。
![](https://github.com/Insfgg99x/FGGTextField/blob/master/FGGTextField.gif)<br>
##Installtion
Manual:

Download This Project and drag the FGGTextField folder into your peroject, do not forget to ensure "copy item if need" being selected.

Cocoapods:
```
pod 'FGGTextField', '~> 1.0.0'
```

##Usage
Just import the header file:`import "FGGTextField.h"`

```
FGGTextField *tf=[[FGGTextField alloc]initWithFrame:CGRectMake(10, 100, kWidth-20, 40)];
tf.placeholder=@"请输入邮箱";
tf.errorText=@"邮箱格式不对";
tf.validatorText=@"邮箱";
[self.view addSubview:tf];
tf.borderStyle=UITextBorderStyleRoundedRect;
tf.keyboardType=UIKeyboardTypeEmailAddress;

AJWValidator *validator=[AJWValidator validatorWithType:AJWValidatorTypeString];
[validator addValidationToEnsureValidEmailWithInvalidMessage:tf.errorText]; [tf  ajw_attachValidator:validator];
__weak typeof(validator) weak_validator=validator;
validator.validatorStateChangedHandler=^(AJWValidatorState state){
            
        switch (state) {
            case AJWValidatorValidationStateValid:
                tf.highlightState=FGGTextFieldHighlightStateValidator;
                leftView.text=@"😁";
                break;
             case AJWValidatorValidationStateInvalid:
                 tf.highlightState=FGGTextFieldHighlightStateWrong;
                 leftView.text=@"😟";
                 break;
             default:
                 break;
         }
         if(weak_validator.isValid){
                
             NSLog(@"格式正确✅");
         }
     };
```
##Example
>1.在项目中导入：FGGTextField.h<br>
2.创建FGGTextField的对象<br>
FGGTextField *tf=[[FGGTextField alloc]initWithFrame:CGRectMake(50, 100, 200, 40)];<br>
3.设置属性<br>
tf.placeholder=@"请输入邮箱";<br>
tf.errorText=@"邮箱格式不正确";<br>
tf.validatorText=@"邮箱";<br>
<br>
tf.borderStyle=UITextBorderStyleRoundedRect;<br>
tf.keyboardType=UIKeyboardTypeEmailAddress;<br>
4.添加到父视图<br>如果有问题，可以给我发邮件：newbox0512@yahoo.com<br>

##About Me
- Blog:     [CGPointZeero](http://cgpointzero.top)
- GitHub:   [Insfgg99x](https://github.com/Insfgg99x)
- Mooc:     [CGPointZero](http://www.imooc.com/u/3909164/articles)
- Jianshu:  [CGPointZero](http://www.jianshu.com/users/c3f2e8c87dc4/latest_articles)
- Email:    [newbox0512@yahoo.com](mailto:newbox0512@yahoo.com)

..............................................................

@CGPoitZero
