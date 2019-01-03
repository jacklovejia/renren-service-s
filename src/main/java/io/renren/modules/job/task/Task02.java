package io.renren.modules.job.task;

import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("Task02")
public class Task02 {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private SysUserService sysUserService;
    public void  runTask(){
        SysUserEntity sysUserEntity = sysUserService.selectById(1L);
        logger.info("新增任务查到一个人"+sysUserEntity.getUsername());
    }
}
