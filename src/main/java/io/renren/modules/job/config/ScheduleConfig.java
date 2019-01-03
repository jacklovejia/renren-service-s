/**
 * Copyright 2018 人人开源 http://www.renren.io
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package io.renren.modules.job.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * 定时任务配置
 *
 * @author Mark sunlightcs@gmail.com
 * @since 2.0.0 2017-04-20
 */
@Configuration
public class ScheduleConfig {

    @Bean
    public SchedulerFactoryBean schedulerFactoryBean(DataSource dataSource) {
        SchedulerFactoryBean factory = new SchedulerFactoryBean();
        factory.setDataSource(dataSource);

        //quartz参数
        Properties prop = new Properties();
        //调度标识名 集群中每一个实例都必须使用相同的名称 （区分特定的调度器实例）
        prop.put("org.quartz.scheduler.instanceName", "RenrenScheduler");
        //ID设置为自动获取 每一个必须不同 （所有调度器实例中是唯一的）
        prop.put("org.quartz.scheduler.instanceId", "AUTO");
        //线程池配置
        prop.put("org.quartz.threadPool.class", "org.quartz.simpl.SimpleThreadPool");
        // 线程数量
        prop.put("org.quartz.threadPool.threadCount", "20");
        // 线程优先级
        prop.put("org.quartz.threadPool.threadPriority", "5");
        //JobStore配置  //数据保存方式为持久化
        prop.put("org.quartz.jobStore.class", "org.quartz.impl.jdbcjobstore.JobStoreTX");
        //集群配置 //加入集群 true 为集群 false不是集群
        prop.put("org.quartz.jobStore.isClustered", "true");
        //调度实例失效的检查时间间隔
        prop.put("org.quartz.jobStore.clusterCheckinInterval", "15000");
        prop.put("org.quartz.jobStore.maxMisfiresToHandleAtATime", "1");
        //容许的最大作业延长时间
        prop.put("org.quartz.jobStore.misfireThreshold", "12000");
        //表的前缀
        prop.put("org.quartz.jobStore.tablePrefix", "QRTZ_");
        prop.put("org.quartz.jobStore.selectWithLockSQL", "SELECT * FROM {0}LOCKS UPDLOCK WHERE LOCK_NAME = ?");

        //PostgreSQL数据库，需要打开此注释
        //prop.put("org.quartz.jobStore.driverDelegateClass", "org.quartz.impl.jdbcjobstore.PostgreSQLDelegate");

        factory.setQuartzProperties(prop);

        factory.setSchedulerName("RenrenScheduler");
        //延时启动
        factory.setStartupDelay(30);
        factory.setApplicationContextSchedulerContextKey("applicationContextKey");
        //可选，QuartzScheduler 启动时更新己存在的Job，这样就不用每次修改targetObject后删除qrtz_job_details表对应记录了
        factory.setOverwriteExistingJobs(true);
        //设置自动启动，默认为true
        factory.setAutoStartup(true);

        return factory;
    }
}
