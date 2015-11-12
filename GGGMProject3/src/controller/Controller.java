package controller;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)//컴파일 이후에도 지속됨
@Target(ElementType.TYPE)//클래스를 찾아옴
public @interface Controller {
	public String value();
}
// @Controller('aaa') => Controller.value() => aaa라는 값을 읽어옴