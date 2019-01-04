package io.renren.modules.api;

import com.baomidou.mybatisplus.plugins.Page;
import io.renren.common.utils.R;
import io.renren.modules.sys.entity.SysMsg_Log;
import io.renren.modules.sys.service.SysMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class TestController {

    @Autowired
    private SysMsgService sysMsgService;

    @RequestMapping("/test01")
    public R test() {
        Page<SysMsg_Log> sysMsg_logPage = sysMsgService.testByPage(new Page<>(1, 1));
        return R.ok().put("data", sysMsg_logPage);
    }
}
