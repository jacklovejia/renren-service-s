package io.renren.common.annotation;

import java.lang.annotation.*;

/**
 * 前端调用接口 需要加上此注解以打印日志
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ApiLog {
    String value() default "";
}
