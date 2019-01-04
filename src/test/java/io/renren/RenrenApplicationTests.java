package io.renren;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import io.renren.common.utils.Query;
import io.renren.modules.job.entity.ScheduleJobLogEntity;
import io.renren.modules.job.service.ScheduleJobService;
import io.renren.modules.sys.entity.SysMsgEntity;
import io.renren.modules.sys.entity.SysMsg_Log;
import io.renren.modules.sys.service.SysMsgService;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RenrenApplicationTests {

    @Autowired
    private SysMsgService sysMsgService;


    @Test
    public void contextLoads() {

//        Map<String, Object> params = new HashedMap();
//        MyPage myPage = new MyPage();
//        myPage.setCurrentPage(1);
//        params.put("myPage", myPage);
//        sysMsgService.testByPage(params);
        // 联合查询demo
//        Page<SysMsg_Log> sysMsg_logPage = sysMsgService.testByPage(new Page<>(1, 1));
//        System.out.println("==========================maps"+sysMsg_logPage);

    }



}

