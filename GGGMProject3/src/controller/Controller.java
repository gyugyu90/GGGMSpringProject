package controller;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)//������ ���Ŀ��� ���ӵ�
@Target(ElementType.TYPE)//Ŭ������ ã�ƿ�
public @interface Controller {
	public String value();
}
// @Controller('aaa') => Controller.value() => aaa��� ���� �о��