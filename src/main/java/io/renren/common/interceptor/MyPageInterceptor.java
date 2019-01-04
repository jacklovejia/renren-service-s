package io.renren.common.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Properties;

import io.renren.common.utils.MyPage;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;

/**
 * 自定义分页插件
 */
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class, Integer.class})})
public class MyPageInterceptor implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
        MetaObject metaObject = MetaObject.forObject(statementHandler, SystemMetaObject.DEFAULT_OBJECT_FACTORY, SystemMetaObject.DEFAULT_OBJECT_WRAPPER_FACTORY, new DefaultReflectorFactory());
        MappedStatement mappedStatement = (MappedStatement) metaObject.getValue("delegate.mappedStatement");
        //通过MetaObject元数据取得方法名id：com.XXX.queryMessageListByPage
        String id = mappedStatement.getId();
        //匹配在mybatis中定义的与分页有关的查询id
        if (id.matches(".+ByPage$")) {
            //BoundSql中有原始的sql语句和对应的查询参数
            BoundSql boundSql = statementHandler.getBoundSql();
            Map<String, Object> params = (Map<String, Object>) boundSql.getParameterObject();
            MyPage page = (MyPage) params.get("myPage");
            String sql = boundSql.getSql();
            String countSql = "select count(*)from (" + sql + ")a";
            Connection connection = (Connection) invocation.getArgs()[0];
            PreparedStatement countStatement = connection.prepareStatement(countSql);
            ParameterHandler parameterHandler = (ParameterHandler) metaObject.getValue("delegate.parameterHandler");
            parameterHandler.setParameters(countStatement);
            ResultSet rs = countStatement.executeQuery();
            if (rs.next()) {
                //为什么是getInt（1）? 因为数据表的列是从1开始计数
                 page.setTotalCount(rs.getInt(1));
                 System.out.println("拦截器得知page的记录总数为：" + page.getTotalCount());
            }
            String pageSql = sql + " limit " + page.getDbIndex() + "," + page.getDbNumber();
            metaObject.setValue("delegate.boundSql.sql", pageSql);
        }
        return invocation.proceed();
    }

    @Override
    public Object plugin(Object target) {
        // 如果将拦截器类比喻为代购票的公司，那this就是代购业务员（进入方法前是无代理购票能力业务员，进入后成为有代理能力的业务员）
        // 通过注解获取拦截目标的信息，如果不符合拦截要求就返回原目标，如果符合则使用动态代理生成代理对象
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {

    }
}
